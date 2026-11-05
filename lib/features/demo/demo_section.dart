import 'dart:math' as math;

import 'package:intl/intl.dart' show NumberFormat;
import 'package:material_ui/material_ui.dart';

import '../../core/preferences.dart';
import '../../design/components.dart';
import '../../design/theme.dart';
import 'ledger.dart';

String money(BuildContext context, int minor, {String currency = 'JPY', int digits = 0}) =>
    NumberFormat.currency(
      locale: Localizations.localeOf(context).toLanguageTag(),
      name: currency,
      symbol: currency == 'JPY' ? '¥' : '€',
      decimalDigits: digits,
    ).format(minor / math.pow(10, digits));

enum AmountError { invalid, tooLarge }

const maxAmount = 1000000;

/// Parses a typed amount into integer minor units, or reports why it was rejected.
///
/// Accepts the locale's own separators as well as the other common convention, so
/// "12.5" in German and "1 200,00" with an ordinary space in French both work. A lone
/// separator followed by exactly three digits is read as grouping unless it is the
/// locale's decimal separator.
({int? minor, AmountError? error}) parseMinorUnits(String input, int digits, String locale) {
  const invalid = (minor: null, error: AmountError.invalid);
  const tooLarge = (minor: null, error: AmountError.tooLarge);
  final decimalSep = NumberFormat.decimalPattern(locale).symbols.DECIMAL_SEP;
  var text = input.replaceAll(RegExp(r"[\s\u00a0\u2009\u202f'’]"), '');
  for (final start in [0x0660, 0x06f0, 0x0966, 0xff10]) {
    for (var i = 0; i < 10; i++) {
      text = text.replaceAll(String.fromCharCode(start + i), '$i');
    }
  }
  text = text.replaceAll(RegExp('[٫．]'), '.').replaceAll(RegExp('[٬，]'), ',');
  if (!RegExp(r'^\d[\d.,]*$').hasMatch(text)) return invalid;

  var integer = text, fraction = '';
  final last = text.lastIndexOf(RegExp('[.,]'));
  if (last >= 0) {
    final sep = text[last];
    final head = text.substring(0, last);
    final tail = text.substring(last + 1);
    final isDecimal =
        head.contains(sep == '.' ? ',' : '.') ||
        (!head.contains(sep) && (sep == decimalSep || tail.length != 3));
    if (isDecimal) {
      if (head.contains(sep)) return invalid;
      integer = head;
      fraction = tail;
    }
  }
  final groups = integer.split(RegExp('[.,]'));
  if (groups.length > 1 &&
      (groups.first.isEmpty ||
          groups.first.length > 3 ||
          groups.last.length != 3 ||
          groups.skip(1).any((g) => g.length < 2 || g.length > 3))) {
    return invalid;
  }
  if (fraction.length > digits) return invalid;
  final whole = groups.join().replaceFirst(RegExp('^0+'), '');
  if (whole.length > 7) return tooLarge;
  final factor = math.pow(10, digits).toInt();
  final amount =
      (whole.isEmpty ? 0 : int.parse(whole)) * factor +
      (fraction.isEmpty ? 0 : int.parse(fraction.padRight(digits, '0')));
  if (amount <= 0) return invalid;
  if (amount > maxAmount * factor) return tooLarge;
  return (minor: amount, error: null);
}

class BalancePreview extends StatelessWidget {
  const BalancePreview({super.key, this.ledger, this.hero = false});
  final DemoLedger? ledger;
  final bool hero;

  @override
  Widget build(BuildContext context) {
    final data = ledger ?? const DemoLedger();
    final values = data.balances;
    final transfers = data.transfers;
    final recipient = data.topCreditor;
    final title = switch (data.scenario) {
      Scenario.travel => context.l.groupTravel,
      Scenario.home => context.l.groupHome,
      Scenario.dinner => context.l.groupDinner,
    };
    String format(int value) => money(context, value, currency: data.currency, digits: data.digits);
    return Semantics(
      container: true,
      child: Panel(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: context.c.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    switch (data.scenario) {
                      Scenario.travel => Icons.local_florist_outlined,
                      Scenario.home => Icons.home_outlined,
                      Scenario.dinner => Icons.restaurant_outlined,
                    },
                    size: 22,
                    color: context.c.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                  ),
                ),
                const Icon(Icons.more_horiz, size: 22),
              ],
            ),
            const SizedBox(height: 22),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
              decoration: BoxDecoration(
                color: context.c.primaryContainer,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    values[recipient] == 0
                        ? context.l.settled
                        : context.l.owed(memberNames[recipient]),
                    style: TextStyle(
                      color: context.c.onPrimaryContainer,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      format(values[recipient]),
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: hero ? 46 : 42,
                        height: 1.2,
                        color: context.c.onPrimaryContainer,
                        letterSpacing: -1.8,
                        fontWeight: FontWeight.w800,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              context.l.balances,
              style: TextStyle(
                fontSize: 14,
                color: context.c.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                4,
                (i) => Expanded(
                  child: Column(
                    children: [
                      PersonAvatar(i),
                      const SizedBox(height: 9),
                      Text(
                        memberNames[i],
                        style: TextStyle(fontSize: 13, color: context.c.onSurfaceVariant),
                      ),
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '${values[i] >= 0 ? '+' : '−'}${format(values[i].abs())}',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: values[i] >= 0 ? context.positive : context.negative,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 26),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: context.c.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l.payments,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 14),
                  if (transfers.isEmpty)
                    Text(context.l.settled, style: TextStyle(color: context.positive)),
                  for (final transfer in (hero ? transfers.take(1) : transfers))
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          PersonAvatar(transfer.from, radius: 15),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(Icons.arrow_forward_rounded, size: 17),
                          ),
                          PersonAvatar(transfer.to, radius: 15),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              format(transfer.amount),
                              textDirection: TextDirection.ltr,
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (hero && transfers.length > 1)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        context.l.morePayments(transfers.length - 1),
                        style: TextStyle(fontSize: 14, color: context.c.onSurfaceVariant),
                      ),
                    ),
                  if (!hero &&
                      transfers.isNotEmpty &&
                      data.separateTransfers > transfers.length) ...[
                    const SizedBox(height: 12),
                    Text(
                      context.l.demoSummary(data.separateTransfers, transfers.length),
                      key: const ValueKey('demo-summary'),
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: context.c.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DemoSection extends StatefulWidget {
  const DemoSection({super.key});
  @override
  State<DemoSection> createState() => _DemoSectionState();
}

class _DemoSectionState extends State<DemoSection> {
  DemoLedger ledger = const DemoLedger();
  final amount = TextEditingController();
  AmountError? error;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (amount.text.isEmpty && error == null) amount.text = formattedAmount();
  }

  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }

  void reset([Scenario? scenario]) {
    setState(() {
      ledger = DemoLedger.forScenario(scenario ?? ledger.scenario);
      amount.text = formattedAmount();
      error = null;
    });
  }

  void select(int index) {
    setState(() {
      ledger = ledger.select(index);
      amount.text = formattedAmount();
      error = null;
    });
  }

  String formattedAmount() => NumberFormat.decimalPatternDigits(
    locale: Localizations.localeOf(context).toLanguageTag(),
    decimalDigits: ledger.digits,
  ).format(ledger.current.amount / math.pow(10, ledger.digits));

  String format(int minor) =>
      money(context, minor, currency: ledger.currency, digits: ledger.digits);

  Widget expenseRow(int index) {
    final expense = ledger.expenses[index];
    final picked = ledger.selected == index;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Semantics(
        selected: picked,
        button: true,
        child: Material(
          color: context.c.surface.withValues(alpha: picked ? 1 : .45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: pickedSide(picked),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            key: ValueKey('expense-$index'),
            onTap: () => select(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Icon(expenseIcon(ledger.scenario, index), size: 22, color: context.c.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // The amount drops below the title when a narrow row can't fit both.
                        SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              Text(
                                expenseTitle(context, ledger.scenario, index),
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                format(expense.amount),
                                textDirection: TextDirection.ltr,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  fontFeatures: [FontFeature.tabularFigures()],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${context.l.paidBy(memberNames[expense.payer])} · '
                          '${expense.mode == SplitMode.equal ? context.l.splitWays(expense.people) : context.l.splitByShares}',
                          style: TextStyle(fontSize: 13, color: context.c.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // On the banana panel a lighter fill alone barely shows which chip is picked; outline it too.
  BorderSide pickedSide(bool picked) =>
      picked ? BorderSide(color: context.c.onPrimaryContainer, width: 1.5) : BorderSide.none;

  TextStyle pickedLabel(bool picked) => TextStyle(
    color: context.c.onPrimaryContainer,
    fontWeight: picked ? FontWeight.w800 : FontWeight.w500,
  );

  Widget shareCounter(int member) {
    Widget step(int delta) => IconButton(
      key: ValueKey('shares-${delta < 0 ? 'fewer' : 'more'}-$member'),
      tooltip: delta < 0
          ? context.l.fewerShares(memberNames[member])
          : context.l.moreShares(memberNames[member]),
      onPressed: ledger.current.canAdjustShares(member, delta)
          ? () => setState(() => ledger = ledger.edit((e) => e.adjustShares(member, delta)))
          : null,
      icon: Icon(delta < 0 ? Icons.remove_rounded : Icons.add_rounded, size: 20),
      style: IconButton.styleFrom(
        backgroundColor: context.c.surface.withValues(alpha: .6),
        disabledBackgroundColor: context.c.surface.withValues(alpha: .25),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          PersonAvatar(member, radius: 13),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              memberNames[member],
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: context.c.onPrimaryContainer,
              ),
            ),
          ),
          step(-1),
          SizedBox(
            width: 36,
            child: Text(
              '${ledger.current.shareCounts[member]}',
              key: ValueKey('shares-$member'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: context.c.onPrimaryContainer,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
          step(1),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SectionTitle(context.l.demoTitle, eyebrow: context.l.demoLabel, subtitle: context.l.demoBody),
      const SizedBox(height: 34),
      LayoutBuilder(
        builder: (context, constraints) {
          final controls = Panel(
            color: context.c.primaryContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: Scenario.values
                      .map(
                        (scenario) => ChoiceChip(
                          key: ValueKey('scenario-${scenario.name}'),
                          label: Text(scenarioName(context, scenario.index)),
                          selected: ledger.scenario == scenario,
                          onSelected: (_) => reset(scenario),
                          showCheckmark: false,
                          selectedColor: banana,
                          labelStyle: TextStyle(
                            color: ledger.scenario == scenario
                                ? const Color(0xFF352900)
                                : context.c.onPrimaryContainer,
                            fontWeight: FontWeight.w700,
                          ),
                          side: BorderSide.none,
                          backgroundColor: context.c.surface.withValues(alpha: .5),
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 26),
                Text(
                  context.l.expensesLabel,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: context.c.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 12),
                for (var i = 0; i < ledger.expenses.length; i++) expenseRow(i),
                const SizedBox(height: 22),
                Text(
                  context.l.editing(expenseTitle(context, ledger.scenario, ledger.selected)),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: context.c.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  key: const ValueKey('demo-amount'),
                  controller: amount,
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.numberWithOptions(decimal: ledger.digits > 0),
                  maxLength: 18,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                  decoration: InputDecoration(
                    labelText: context.l.amountLabel,
                    suffixText: ledger.currency,
                    counterText: '',
                    errorText: switch (error) {
                      AmountError.invalid => context.l.invalidAmount,
                      AmountError.tooLarge => context.l.amountTooLarge,
                      null => null,
                    },
                    helperText:
                        '${money(context, 1, currency: ledger.currency, digits: ledger.digits)} – '
                        '${money(context, maxAmount * math.pow(10, ledger.digits).toInt(), currency: ledger.currency, digits: ledger.digits)}',
                  ),
                  onChanged: (value) {
                    final parsed = parseMinorUnits(
                      value,
                      ledger.digits,
                      Localizations.localeOf(context).toLanguageTag(),
                    );
                    setState(() {
                      error = parsed.error;
                      if (parsed.minor case final minor?) {
                        ledger = ledger.edit((e) => e.copyWith(amount: minor));
                      }
                    });
                  },
                ),
                const SizedBox(height: 25),
                Text(
                  context.l.payer,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: context.c.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    4,
                    (i) => ChoiceChip(
                      key: ValueKey('payer-$i'),
                      avatar: PersonAvatar(i, radius: 13),
                      label: Text(memberNames[i]),
                      selected: ledger.current.payer == i,
                      showCheckmark: false,
                      onSelected: (_) =>
                          setState(() => ledger = ledger.edit((e) => e.copyWith(payer: i))),
                      selectedColor: context.c.surface,
                      backgroundColor: context.c.surface.withValues(alpha: .4),
                      side: pickedSide(ledger.current.payer == i),
                      labelStyle: pickedLabel(ledger.current.payer == i),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: SplitMode.values
                      .map(
                        (mode) => ChoiceChip(
                          key: ValueKey('split-${mode.name}'),
                          label: Text(
                            mode == SplitMode.equal ? context.l.splitEqual : context.l.splitShares,
                          ),
                          selected: ledger.current.mode == mode,
                          showCheckmark: false,
                          onSelected: (_) =>
                              setState(() => ledger = ledger.edit((e) => e.copyWith(mode: mode))),
                          selectedColor: context.c.surface,
                          backgroundColor: context.c.surface.withValues(alpha: .4),
                          side: pickedSide(ledger.current.mode == mode),
                          labelStyle: pickedLabel(ledger.current.mode == mode),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        ),
                      )
                      .toList(),
                ),
                if (ledger.current.mode == SplitMode.shares) ...[
                  const SizedBox(height: 16),
                  for (var i = 0; i < memberNames.length; i++) shareCounter(i),
                  const SizedBox(height: 6),
                  Text(
                    context.l.weightedHelp,
                    style: TextStyle(fontSize: 14, color: context.c.onPrimaryContainer),
                  ),
                ],
                const SizedBox(height: 24),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    TextButton.icon(
                      key: const ValueKey('demo-reset'),
                      onPressed: reset,
                      icon: const Icon(Icons.refresh_rounded, size: 17),
                      label: Text(context.l.reset),
                    ),
                    Text(
                      context.l.demoNotice,
                      style: TextStyle(fontSize: 13, color: context.c.onPrimaryContainer),
                    ),
                  ],
                ),
              ],
            ),
          );
          final preview = BalancePreview(ledger: ledger);
          return constraints.maxWidth >= 850
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 6, child: controls),
                    const SizedBox(width: 24),
                    Expanded(flex: 5, child: preview),
                  ],
                )
              : Column(children: [controls, const SizedBox(height: 20), preview]);
        },
      ),
    ],
  );
}

String expenseTitle(BuildContext context, Scenario scenario, int index) =>
    switch ((scenario, index)) {
      (Scenario.travel, 0) => context.l.expenseHotel,
      (Scenario.travel, 1) => context.l.expenseCar,
      (Scenario.travel, 2) => context.l.expenseGionDinner,
      (Scenario.travel, _) => context.l.expenseTea,
      (Scenario.home, 0) => context.l.expenseRent,
      (Scenario.home, 1) => context.l.expenseGroceries,
      (Scenario.home, 2) => context.l.expensePower,
      (Scenario.home, _) => context.l.expenseInternet,
      (Scenario.dinner, 0) => context.l.expenseDinner,
      (Scenario.dinner, 1) => context.l.expenseDrinks,
      (Scenario.dinner, 2) => context.l.expenseDessert,
      (Scenario.dinner, _) => context.l.expenseTaxi,
    };

IconData expenseIcon(Scenario scenario, int index) => switch ((scenario, index)) {
  (Scenario.travel, 0) => Icons.hotel_outlined,
  (Scenario.travel, 1) => Icons.directions_car_outlined,
  (Scenario.travel, 2) => Icons.ramen_dining_outlined,
  (Scenario.travel, _) => Icons.emoji_food_beverage_outlined,
  (Scenario.home, 0) => Icons.key_outlined,
  (Scenario.home, 1) => Icons.shopping_basket_outlined,
  (Scenario.home, 2) => Icons.bolt_outlined,
  (Scenario.home, _) => Icons.wifi_rounded,
  (Scenario.dinner, 0) => Icons.restaurant_outlined,
  (Scenario.dinner, 1) => Icons.local_bar_outlined,
  (Scenario.dinner, 2) => Icons.icecream_outlined,
  (Scenario.dinner, _) => Icons.local_taxi_outlined,
};
