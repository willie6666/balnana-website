import assert from 'node:assert/strict';
import { test } from 'node:test';
import { parseMinorUnits } from '../src/demo/amount.ts';
import {
	adjustShares,
	balances,
	canAdjustShares,
	edit,
	expense,
	scenarioLedger,
	scenarios,
	separateTransfers,
	shares,
	topCreditor,
	transfers,
	type Expense,
} from '../src/demo/ledger.ts';
import { supportedTag } from '../src/i18n/index.ts';

test('rounding distributes minor units without losing money', () => {
	assert.deepEqual(shares(expense(1, 0)), [1, 0, 0, 0]);
	assert.deepEqual(shares(expense(7, 0, [2, 1, 1, 1])), [3, 2, 1, 1]);
	assert.deepEqual(transfers({ scenario: 'travel', expenses: [expense(1, 0)], selected: 0 }), []);
});

test('share counts stay between 0 and the limit and never all reach 0', () => {
	const e = expense(12000, 0, [1, 0, 0, 10]);
	assert.deepEqual(adjustShares(e, 1, -1).shareCounts, [1, 0, 0, 10]);
	assert.deepEqual(adjustShares(e, 3, 1).shareCounts, [1, 0, 0, 10]);
	assert.deepEqual(adjustShares(e, 1, 1).shareCounts, [1, 1, 0, 10]);
	assert.equal(canAdjustShares(expense(12000, 0, [0, 0, 1, 0]), 2, -1), false);
	assert.deepEqual(shares(expense(9, 0, [0, 2, 1, 0])), [0, 6, 3, 0]);
	// Equal mode ignores the stored share counts.
	assert.deepEqual(shares({ ...expense(9, 0, [0, 2, 1, 0]), mode: 'equal' }), [3, 2, 2, 2]);
});

test('the sample trip nets four bills down to three transfers', () => {
	const ledger = scenarioLedger('travel');
	assert.deepEqual(balances(ledger), [19350, 7350, -7050, -19650]);
	assert.equal(topCreditor(ledger), 0);
	assert.equal(separateTransfers(ledger), 11);
	assert.deepEqual(transfers(ledger), [
		{ from: 3, to: 0, amount: 19350 },
		{ from: 2, to: 1, amount: 7050 },
		{ from: 3, to: 1, amount: 300 },
	]);
	const edited = edit({ ...ledger, selected: 1 }, (e) => ({ ...e, payer: 2 }));
	assert.equal(edited.expenses[1].payer, 2);
	assert.equal(edited.expenses[0].payer, 0);
});

test('every demo result preserves money and its suggested payments settle every balance', () => {
	const splits: [Expense['mode'], number[]][] = [
		['equal', [2, 1, 1, 1]],
		['shares', [2, 1, 1, 1]],
		['shares', [0, 3, 1, 0]],
		['shares', [10, 0, 0, 0]],
		['shares', [7, 9, 10, 3]],
	];
	for (const amount of [1, 2, 3, 5, 7, 99, 12000, 999999, 1000000, 100000000]) {
		for (const [mode, shareCounts] of splits) {
			for (let payer = 0; payer < 4; payer++) {
				const e: Expense = { amount, payer, mode, shareCounts };
				assert.equal(
					shares(e).reduce((a, b) => a + b),
					amount,
				);
				for (const scenario of scenarios) {
					const ledger = edit(scenarioLedger(scenario), () => e);
					const remaining = balances(ledger);
					assert.equal(
						remaining.reduce((a, b) => a + b),
						0,
					);
					const suggested = transfers(ledger);
					for (const transfer of suggested) {
						assert.ok(transfer.amount > 0);
						remaining[transfer.from] += transfer.amount;
						remaining[transfer.to] -= transfer.amount;
					}
					assert.deepEqual(remaining, [0, 0, 0, 0]);
					assert.ok(suggested.length <= 3);
				}
			}
		}
	}
});

test('localized amounts are parsed as integer minor units and bounded', () => {
	const minor = (input: string, digits: number, locale: string) => parseMinorUnits(input, digits, locale).minor;
	assert.equal(minor('1,234.56', 2, 'en'), 123456);
	assert.equal(minor('1.234,56', 2, 'de'), 123456);
	assert.equal(minor('١٢٣', 0, 'ar'), 123);
	assert.equal(minor('१२.३४', 2, 'hi'), 1234);
	assert.equal(minor('１２．５', 2, 'zh-Hant'), 1250);
	assert.equal(minor('0.01', 2, 'en'), 1);
	assert.equal(minor('12,000', 0, 'en'), 12000);
	assert.equal(minor('12.000', 0, 'de'), 12000);
	assert.equal(minor('1,00,000', 0, 'hi'), 100000);
	for (const input of ['', '0', '-2', 'abc', '1.001', '1,2,3', '1.2.3,4,5', '.5']) {
		assert.equal(parseMinorUnits(input, 2, 'en').error, 'invalid', input);
	}
	assert.equal(parseMinorUnits('1.5', 0, 'en').error, 'invalid');
});

test('the other decimal convention and ordinary spaces are understood', () => {
	const minor = (input: string, locale: string) => parseMinorUnits(input, 2, locale).minor;
	assert.equal(minor('12.5', 'de'), 1250);
	assert.equal(minor('12,5', 'en'), 1250);
	assert.equal(minor('12,5', 'zh'), 1250);
	assert.equal(minor('1 200,00', 'fr'), 120000);
	assert.equal(minor('1 200,00', 'fr'), 120000);
	assert.equal(minor(' 96,00 ', 'pl'), 9600);
});

test('amounts above the demo limit are reported as too large, not invalid', () => {
	assert.equal(parseMinorUnits('1000000', 2, 'en').minor, 100000000);
	assert.equal(parseMinorUnits('1000001', 2, 'en').error, 'tooLarge');
	assert.equal(parseMinorUnits('2,000,000', 0, 'en').error, 'tooLarge');
	assert.equal(parseMinorUnits('99999999999999999', 0, 'en').error, 'tooLarge');
});

test('Chinese script and browser region resolution match the app', () => {
	assert.equal(supportedTag('zh-TW'), 'zh-Hant');
	assert.equal(supportedTag('zh-HK'), 'zh-Hant');
	assert.equal(supportedTag('zh-Hant'), 'zh-Hant');
	assert.equal(supportedTag('zh_Hant_TW'), 'zh-Hant');
	assert.equal(supportedTag('zh-CN'), 'zh');
	assert.equal(supportedTag('zh'), 'zh');
	assert.equal(supportedTag('en-GB'), 'en');
	assert.equal(supportedTag('de-DE'), undefined);
	assert.equal(supportedTag(null), undefined);
});
