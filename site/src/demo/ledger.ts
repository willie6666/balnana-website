/** The sample group's sums: four members, a few bills, settled together. Amounts are integer minor units. */

export type Scenario = 'travel' | 'home' | 'dinner';
export type SplitMode = 'equal' | 'shares';

export const scenarios: Scenario[] = ['travel', 'home', 'dinner'];
export const memberNames = ['Alex', 'Jamie', 'Morgan', 'Sam'];
export const maxShares = 10;

/** One bill: who paid it and how the four members share it. */
export interface Expense {
	amount: number;
	payer: number;
	mode: SplitMode;
	/** Each member's shares in `shares` mode; kept when switching modes. */
	shareCounts: number[];
}

export interface Transfer {
	from: number;
	to: number;
	amount: number;
}

export interface Ledger {
	scenario: Scenario;
	expenses: Expense[];
	/** Index of the expense being edited. */
	selected: number;
}

const sum = (values: number[]) => values.reduce((a, b) => a + b, 0);

export const expense = (amount: number, payer: number, shareCounts?: number[]): Expense => ({
	amount,
	payer,
	mode: shareCounts ? 'shares' : 'equal',
	shareCounts: shareCounts ?? [1, 1, 1, 1],
});

const weights = (e: Expense) => (e.mode === 'equal' ? [1, 1, 1, 1] : e.shareCounts);

/** How many people share the bill. */
export const people = (e: Expense) => weights(e).filter((w) => w > 0).length;

/** Whether a member's shares can change by `step` without leaving nobody to pay. */
export function canAdjustShares(e: Expense, member: number, step: number) {
	const next = e.shareCounts[member] + step;
	return next >= 0 && next <= maxShares && sum(e.shareCounts) + step > 0;
}

export const adjustShares = (e: Expense, member: number, step: number): Expense =>
	canAdjustShares(e, member, step)
		? { ...e, shareCounts: e.shareCounts.map((n, i) => (i === member ? n + step : n)) }
		: e;

/** Each member's part of the bill. Leftover minor units go to the largest remainders first. */
export function shares(e: Expense) {
	const w = weights(e);
	const total = sum(w);
	const result = w.map((n) => Math.floor((e.amount * n) / total));
	let remainder = e.amount - sum(result);
	const priority = w
		.map((_, i) => i)
		.sort((a, b) => ((e.amount * w[b]) % total) - ((e.amount * w[a]) % total) || a - b);
	for (const member of priority) {
		if (remainder-- <= 0) break;
		result[member]++;
	}
	return result;
}

const expenseBalances = (e: Expense) => shares(e).map((share, i) => (i === e.payer ? e.amount : 0) - share);

/** Transfers needed to pay one bill back on its own: one from everyone else who shares it. */
const expenseTransfers = (e: Expense) => shares(e).filter((share, i) => i !== e.payer && share > 0).length;

export function scenarioLedger(scenario: Scenario): Ledger {
	const expenses = {
		travel: [expense(48000, 0), expense(36000, 1), expense(18600, 2), expense(9000, 3, [1, 1, 0, 1])],
		// The rent is split by room size; the others are split equally.
		home: [expense(180000, 0, [3, 2, 2, 2]), expense(12640, 1), expense(8800, 2), expense(4000, 3)],
		// Sam skipped the drinks and Alex walked home.
		dinner: [expense(14800, 0), expense(5400, 1, [1, 1, 1, 0]), expense(2600, 2), expense(3000, 3, [0, 1, 1, 1])],
	}[scenario];
	return { scenario, expenses, selected: 0 };
}

/** The trip is in yen, which has no minor unit; the other groups are in euros. */
export const currencyOf = (scenario: Scenario) =>
	scenario === 'travel' ? { code: 'JPY', symbol: '¥', digits: 0 } : { code: 'EUR', symbol: '€', digits: 2 };

export const balances = (ledger: Ledger) =>
	[0, 1, 2, 3].map((i) => sum(ledger.expenses.map((e) => expenseBalances(e)[i])));

/** The member owed the most, who heads the balance card. */
export function topCreditor(ledger: Ledger) {
	const values = balances(ledger);
	return values.indexOf(Math.max(...values));
}

/** Transfers needed if every bill were paid back separately. */
export const separateTransfers = (ledger: Ledger) => sum(ledger.expenses.map(expenseTransfers));

/** Suggested payments: whoever owes the most pays whoever is owed the most, until all are even. */
export function transfers(ledger: Ledger) {
	const remaining = balances(ledger);
	const result: Transfer[] = [];
	for (;;) {
		const from = remaining.indexOf(Math.min(...remaining));
		const to = remaining.indexOf(Math.max(...remaining));
		if (remaining[from] >= 0) break;
		const amount = Math.min(-remaining[from], remaining[to]);
		result.push({ from, to, amount });
		remaining[from] += amount;
		remaining[to] -= amount;
	}
	return result;
}

/** The ledger with `change` applied to the selected expense. */
export const edit = (ledger: Ledger, change: (e: Expense) => Expense): Ledger => ({
	...ledger,
	expenses: ledger.expenses.map((e, i) => (i === ledger.selected ? change(e) : e)),
});
