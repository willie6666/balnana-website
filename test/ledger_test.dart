import 'package:flutter_test/flutter_test.dart';
import 'package:balnana_website/features/demo/ledger.dart';
import 'package:balnana_website/features/demo/demo_section.dart' show AmountError, parseMinorUnits;
import 'package:balnana_website/core/preferences.dart';

void main() {
  test('rounding distributes minor units without losing money', () {
    expect(const DemoLedger(amount: 1).shares, [1, 0, 0, 0]);
    expect(const DemoLedger(amount: 7, mode: SplitMode.shares).shares, [3, 2, 1, 1]);
    expect(const DemoLedger(amount: 1).transfers, isEmpty);
  });
  test('share counts stay between 0 and the limit and never all reach 0', () {
    const ledger = DemoLedger(mode: SplitMode.shares, shareCounts: [1, 0, 0, 10]);
    expect(ledger.adjustShares(1, -1).shareCounts, [1, 0, 0, 10]);
    expect(ledger.adjustShares(3, 1).shareCounts, [1, 0, 0, 10]);
    expect(ledger.adjustShares(1, 1).shareCounts, [1, 1, 0, 10]);
    const last = DemoLedger(mode: SplitMode.shares, shareCounts: [0, 0, 1, 0]);
    expect(last.canAdjustShares(2, -1), isFalse);
    expect(const DemoLedger(amount: 9, mode: SplitMode.shares, shareCounts: [0, 2, 1, 0]).shares, [
      0,
      6,
      3,
      0,
    ]);
    expect(const DemoLedger(amount: 9, shareCounts: [0, 2, 1, 0]).shares, [3, 2, 2, 2]);
  });
  test('every demo result preserves money and its suggested payments settle every balance', () {
    for (final amount in [1, 2, 3, 5, 7, 99, 12000, 999999, 1000000]) {
      for (final (mode, counts) in [
        (SplitMode.equal, const [2, 1, 1, 1]),
        (SplitMode.shares, const [2, 1, 1, 1]),
        (SplitMode.shares, const [0, 3, 1, 0]),
        (SplitMode.shares, const [10, 0, 0, 0]),
        (SplitMode.shares, const [7, 9, 10, 3]),
      ]) {
        for (var payer = 0; payer < 4; payer++) {
          final ledger = DemoLedger(amount: amount, mode: mode, payer: payer, shareCounts: counts);
          expect(ledger.shares.reduce((a, b) => a + b), amount);
          expect(ledger.balances.reduce((a, b) => a + b), 0);
          final balances = ledger.balances.toList();
          for (final transfer in ledger.transfers) {
            expect(transfer.amount, greaterThan(0));
            balances[transfer.from] += transfer.amount;
            balances[transfer.to] -= transfer.amount;
          }
          expect(balances, [0, 0, 0, 0]);
          expect(ledger.transfers.length, lessThanOrEqualTo(3));
        }
      }
    }
  });
  test('localized amounts are parsed as integer minor units and bounded', () {
    int? minor(String input, int digits, String locale) =>
        parseMinorUnits(input, digits, locale).minor;
    expect(minor('1,234.56', 2, 'en'), 123456);
    expect(minor('1.234,56', 2, 'de'), 123456);
    expect(minor('١٢٣', 0, 'ar'), 123);
    expect(minor('१२.३४', 2, 'hi'), 1234);
    expect(minor('0.01', 2, 'en'), 1);
    expect(minor('12,000', 0, 'en'), 12000);
    expect(minor('12.000', 0, 'de'), 12000);
    expect(minor('1,00,000', 0, 'hi'), 100000);
    for (final input in ['0', '-2', 'abc', '1.001', '1,2,3', '1.2.3,4,5', '.5']) {
      expect(parseMinorUnits(input, 2, 'en').error, AmountError.invalid, reason: input);
    }
    expect(parseMinorUnits('1.5', 0, 'en').error, AmountError.invalid);
  });
  test('the other decimal convention and ordinary spaces are understood', () {
    int? minor(String input, String locale) => parseMinorUnits(input, 2, locale).minor;
    expect(minor('12.5', 'de'), 1250);
    expect(minor('12.50', 'es'), 1250);
    expect(minor('12,5', 'en'), 1250);
    expect(minor('1 200,00', 'fr'), 120000);
    expect(minor('1\u202f200,00', 'fr'), 120000);
    expect(minor('1 200,00', 'ru'), 120000);
    expect(minor(' 96,00 ', 'pl'), 9600);
  });
  test('amounts above the demo limit are reported as too large, not invalid', () {
    expect(parseMinorUnits('1000000', 2, 'en').minor, 100000000);
    expect(parseMinorUnits('1000001', 2, 'en').error, AmountError.tooLarge);
    expect(parseMinorUnits('2,000,000', 0, 'en').error, AmountError.tooLarge);
    expect(parseMinorUnits('99999999999999999', 0, 'en').error, AmountError.tooLarge);
  });
  test('Chinese script and browser region resolution match the App', () {
    expect(supportedTag('zh-TW'), 'zh-Hant');
    expect(supportedTag('zh-HK'), 'zh-Hant');
    expect(supportedTag('zh-Hant'), 'zh-Hant');
    expect(supportedTag('zh-CN'), 'zh');
    expect(supportedTag('de-DE'), 'de');
    expect(supportedTag('xyz'), isNull);
  });
}
