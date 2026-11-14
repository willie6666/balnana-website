/** Runs the sample group on the page: edits change the ledger, and the marked parts are redrawn. */
import { fill } from '../i18n/fill.ts';
import { formatAmount, formatMoney, maxAmount, parseMinorUnits, type AmountError } from './amount.ts';
import {
	adjustShares,
	balances,
	canAdjustShares,
	currencyOf,
	edit,
	memberNames,
	people,
	scenarioLedger,
	separateTransfers,
	topCreditor,
	transfers,
	type Scenario,
	type SplitMode,
} from './ledger.ts';

interface DemoMessages {
	groups: Record<Scenario, { name: string; expenses: string[] }>;
	paidBy: string;
	splitWays: string;
	splitByShares: string;
	editing: string;
	owed: string;
	settled: string;
	demoSummary: string;
	transferLabel: string;
	invalid: string;
	tooLarge: string;
}

const root = document.querySelector<HTMLElement>('[data-demo]');
if (root) start(root);

function start(root: HTMLElement) {
	const locale = document.documentElement.lang;
	const text: DemoMessages = JSON.parse(root.dataset.messages!);
	const all = (selector: string) => [...root.querySelectorAll<HTMLElement>(selector)];
	const slots = (name: string) => all(`[data-slot="${name}"]`);
	const press = (selector: string, on: (el: HTMLElement) => boolean) =>
		all(selector).forEach((el) => el.setAttribute('aria-pressed', String(on(el))));

	const input = root.querySelector<HTMLInputElement>('[data-amount]')!;
	const amountBox = root.querySelector('[data-amount-box]')!;
	const shareRows = root.querySelector<HTMLElement>('[data-shares]')!;
	const transferRow = root.querySelector<HTMLTemplateElement>('template[data-slot="transfer-row"]')!;

	let ledger = scenarioLedger('travel');
	let error: AmountError | undefined;

	/** Shows the selected expense's amount in the field, replacing whatever was typed. */
	function showAmount() {
		const { digits } = currencyOf(ledger.scenario);
		input.value = formatAmount(ledger.expenses[ledger.selected].amount, digits, locale);
		input.inputMode = digits ? 'decimal' : 'numeric';
		error = undefined;
	}

	function draw() {
		const currency = currencyOf(ledger.scenario);
		const money = (minor: number) => formatMoney(minor, currency, locale);
		const group = text.groups[ledger.scenario];
		const current = ledger.expenses[ledger.selected];
		root.dataset.scenario = ledger.scenario;

		press('[data-pick-scenario]', (el) => el.dataset.pickScenario === ledger.scenario);
		press('[data-pick-expense]', (el) => Number(el.dataset.pickExpense) === ledger.selected);
		press('[data-pick-payer]', (el) => Number(el.dataset.pickPayer) === current.payer);
		press('[data-pick-mode]', (el) => el.dataset.pickMode === current.mode);

		ledger.expenses.forEach((e, i) => {
			slots('title')[i].textContent = group.expenses[i];
			slots('amount')[i].textContent = money(e.amount);
			const split = e.mode === 'equal' ? fill(text.splitWays, { count: people(e) }) : text.splitByShares;
			slots('meta')[i].textContent = `${fill(text.paidBy, { name: memberNames[e.payer] })} · ${split}`;
		});
		slots('editing')[0].textContent = fill(text.editing, { expense: group.expenses[ledger.selected] });
		slots('currency')[0].textContent = currency.code;

		const help = slots('help')[0];
		help.textContent = error ? text[error] : `${money(1)} – ${money(maxAmount * 10 ** currency.digits)}`;
		help.classList.toggle('error', !!error);
		amountBox.classList.toggle('invalid', !!error);
		input.setAttribute('aria-invalid', String(!!error));

		shareRows.hidden = current.mode !== 'shares';
		slots('shares').forEach((el, i) => (el.textContent = String(current.shareCounts[i])));
		for (const button of all('[data-share]') as HTMLButtonElement[]) {
			button.disabled = !canAdjustShares(current, Number(button.dataset.share), Number(button.dataset.step));
		}

		const values = balances(ledger);
		const creditor = topCreditor(ledger);
		const payments = transfers(ledger);
		slots('group')[0].textContent = group.name;
		slots('owed')[0].textContent = values[creditor] ? fill(text.owed, { name: memberNames[creditor] }) : text.settled;
		slots('total')[0].textContent = money(values[creditor]);
		slots('balance').forEach((el, i) => {
			el.textContent = (values[i] < 0 ? '−' : '+') + money(Math.abs(values[i]));
			el.classList.toggle('neg', values[i] < 0);
			el.classList.toggle('pos', values[i] >= 0);
		});
		slots('transfers')[0].replaceChildren(
			...payments.map(({ from, to, amount }) => {
				const row = transferRow.content.firstElementChild!.cloneNode(true) as HTMLElement;
				const [payer, payee] = row.querySelectorAll('.avatar');
				for (const [el, member] of [[payer, from], [payee, to]] as const) {
					el.classList.add(`m${member}`);
					el.textContent = memberNames[member][0];
					el.setAttribute('title', memberNames[member]);
				}
				row.querySelector('.sr-only')!.textContent = fill(text.transferLabel, {
					from: memberNames[from],
					to: memberNames[to],
				});
				row.querySelector('strong')!.textContent = money(amount);
				return row;
			}),
		);
		// Under the payments: how much netting saved, or that there is nothing left to pay.
		const note = slots('summary')[0];
		const separate = separateTransfers(ledger);
		note.classList.toggle('pos', !payments.length);
		note.hidden = payments.length > 0 && separate <= payments.length;
		note.textContent = payments.length
			? fill(text.demoSummary, { separate, payments: payments.length })
			: text.settled;
	}

	function reset(scenario: Scenario) {
		ledger = scenarioLedger(scenario);
		showAmount();
	}

	root.addEventListener('click', (event) => {
		const pick = (event.target as Element).closest<HTMLElement>('button')?.dataset;
		if (!pick) return;
		if (pick.pickScenario) reset(pick.pickScenario as Scenario);
		else if (pick.pickExpense) {
			ledger = { ...ledger, selected: Number(pick.pickExpense) };
			showAmount();
		} else if (pick.pickPayer) ledger = edit(ledger, (e) => ({ ...e, payer: Number(pick.pickPayer) }));
		else if (pick.pickMode) ledger = edit(ledger, (e) => ({ ...e, mode: pick.pickMode as SplitMode }));
		else if (pick.share) ledger = edit(ledger, (e) => adjustShares(e, Number(pick.share), Number(pick.step)));
		else if ('reset' in pick) reset(ledger.scenario);
		else return;
		draw();
	});

	input.addEventListener('input', () => {
		const parsed = parseMinorUnits(input.value, currencyOf(ledger.scenario).digits, locale);
		error = parsed.error;
		if (parsed.minor) ledger = edit(ledger, (e) => ({ ...e, amount: parsed.minor }));
		draw();
	});
}
