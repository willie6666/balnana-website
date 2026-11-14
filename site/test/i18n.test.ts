import assert from 'node:assert/strict';
import { test } from 'node:test';
import { languages, langs } from '../src/i18n/index.ts';

test('every language has every message, with the same placeholders as English', () => {
	const placeholders = (message: string) => [...message.matchAll(/\{(\w+)\}/g)].map((m) => m[1]).sort();
	const en: Record<string, string> = languages.en.messages;
	assert.deepEqual(langs, ['en', 'zh-Hant', 'zh']);
	for (const lang of langs) {
		const messages: Record<string, string> = languages[lang].messages;
		assert.deepEqual(Object.keys(messages).sort(), Object.keys(en).sort(), `${lang}: message keys differ`);
		for (const [key, message] of Object.entries(messages)) {
			assert.ok(message.trim(), `${lang}: ${key} is empty`);
			assert.deepEqual(placeholders(message), placeholders(en[key]), `${lang}: ${key} placeholders differ`);
		}
	}
});
