/** Fills `{name}` style placeholders in a message. */
export const fill = (message: string, values: Record<string, string | number>) =>
	message.replace(/\{(\w+)\}/g, (_, key: string) => String(values[key]));
