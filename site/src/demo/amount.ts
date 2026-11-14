export const maxAmount = 1_000_000;

export type AmountError = 'invalid' | 'tooLarge';

const number = (minor: number, digits: number, locale: string) =>
	new Intl.NumberFormat(locale, { minimumFractionDigits: digits, maximumFractionDigits: digits }).format(
		minor / 10 ** digits,
	);

/** A plain localized amount, as shown in the amount field. */
export const formatAmount = number;

/** An amount with its currency symbol in front, such as ¥19,350 or €12.50. */
export const formatMoney = (minor: number, currency: { symbol: string; digits: number }, locale: string) =>
	currency.symbol + number(minor, currency.digits, locale);

/**
 * Parses a typed amount into integer minor units, or reports why it was rejected.
 *
 * Accepts the locale's own separators as well as the other common convention, so "12,5" in
 * English and "1 200,00" both work. A lone separator followed by exactly three digits is read
 * as grouping unless it is the locale's decimal separator.
 */
export function parseMinorUnits(
	input: string,
	digits: number,
	locale: string,
): { minor: number; error?: undefined } | { minor?: undefined; error: AmountError } {
	const invalid = { error: 'invalid' } as const;
	const tooLarge = { error: 'tooLarge' } as const;
	const decimalSep = new Intl.NumberFormat(locale).formatToParts(1.5).find((p) => p.type === 'decimal')?.value;
	let text = input.replace(/[\s   '’]/g, '');
	// Arabic-Indic, Persian, Devanagari and full-width digits.
	for (const start of [0x0660, 0x06f0, 0x0966, 0xff10]) {
		for (let i = 0; i < 10; i++) text = text.replaceAll(String.fromCharCode(start + i), String(i));
	}
	text = text.replace(/[٫．]/g, '.').replace(/[٬，]/g, ',');
	if (!/^\d[\d.,]*$/.test(text)) return invalid;

	let integer = text;
	let fraction = '';
	const last = Math.max(text.lastIndexOf('.'), text.lastIndexOf(','));
	if (last >= 0) {
		const sep = text[last];
		const head = text.slice(0, last);
		const tail = text.slice(last + 1);
		const isDecimal =
			head.includes(sep === '.' ? ',' : '.') || (!head.includes(sep) && (sep === decimalSep || tail.length !== 3));
		if (isDecimal) {
			if (head.includes(sep)) return invalid;
			integer = head;
			fraction = tail;
		}
	}
	const groups = integer.split(/[.,]/);
	if (
		groups.length > 1 &&
		(groups[0].length === 0 ||
			groups[0].length > 3 ||
			groups[groups.length - 1].length !== 3 ||
			groups.slice(1).some((g) => g.length < 2 || g.length > 3))
	) {
		return invalid;
	}
	if (fraction.length > digits) return invalid;
	const whole = groups.join('').replace(/^0+/, '');
	if (whole.length > 7) return tooLarge;
	const factor = 10 ** digits;
	const amount = Number(whole || 0) * factor + Number(fraction.padEnd(digits, '0') || 0);
	if (amount <= 0) return invalid;
	if (amount > maxAmount * factor) return tooLarge;
	return { minor: amount };
}
