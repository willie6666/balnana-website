import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { existsSync, mkdirSync, mkdtempSync, readdirSync, readFileSync, rmSync } from 'node:fs';
import { join } from 'node:path';
import { after, test } from 'node:test';

// Astro moves its files into place, which only works within one disk, so the output stays
// inside the project's ignored .astro folder instead of the system's temporary one.
mkdirSync('.astro', { recursive: true });
const out = mkdtempSync(join('.astro', 'test-build-'));
after(() => rmSync(out, { recursive: true, force: true }));

/** Builds the site into the temporary folder, as tool/build.sh does, and returns a file reader. */
function build(siteUrl?: string) {
	const env = { ...process.env, SITE_URL: siteUrl ?? '' };
	const result = spawnSync('npx', ['astro', 'build', '--outDir', out], { env, encoding: 'utf8' });
	return { ok: result.status === 0, read: (file: string) => readFileSync(join(out, file), 'utf8') };
}

test('a build without SITE_URL is a preview that search engines skip', () => {
	const { ok, read } = build();
	assert.ok(ok);
	const pages = readdirSync(out, { recursive: true, encoding: 'utf8' }).filter((name) => name.endsWith('.html'));
	assert.deepEqual(pages.sort(), ['404.html', 'en.html', 'index.html', 'privacy.html', 'zh-Hant.html', 'zh-Hant/privacy.html', 'zh.html', 'zh/privacy.html']);
	assert.match(read('zh.html'), /<html lang="zh-Hans" dir="ltr">/);
	assert.match(read('zh.html'), /先付再说/);
	for (const page of pages) {
		assert.match(read(page), /<meta name="robots" content="noindex, nofollow">/, page);
		assert.doesNotMatch(read(page), /rel="canonical"|rel="alternate"/, page);
	}
	assert.equal(read('robots.txt'), 'User-agent: *\nDisallow: /\n');
	assert.ok(!existsSync(join(out, 'sitemap.xml')));
	// Older phones and emulator images don't understand the newer `(width >= 40rem)` form.
	assert.match(read('en.html'), /@media \(min-width:/);
	assert.doesNotMatch(read('en.html'), /@media \(width/);
	// Only the root page sends visitors on to their language.
	assert.match(read('index.html'), /location\.replace\(/);
	assert.doesNotMatch(read('en.html'), /location\.replace\(/);
	assertPrivacyPages(read);
});

test('a build with SITE_URL has canonical addresses, alternates and a sitemap', () => {
	const { ok, read } = build('https://website.example');
	assert.ok(ok);
	const page = read('zh-Hant.html');
	assert.match(page, /先付再說/);
	assert.match(page, /<link rel="canonical" href="https:\/\/website\.example\/zh-Hant">/);
	assert.match(page, /<meta property="og:locale" content="zh_TW">/);
	assert.match(page, /<meta property="og:image" content="https:\/\/website\.example\/social-preview\.png">/);
	assert.equal(page.match(/<link rel="alternate" hreflang=/g)?.length, 4);
	// /zh is Simplified Chinese, and says so with the script in its language tag.
	assert.match(page, /<link rel="alternate" hreflang="zh-Hans" href="https:\/\/website\.example\/zh">/);
	assert.match(page, /<meta property="og:image:alt" content="Balnana — 先付再說，回頭一次算清。">/);
	assert.doesNotMatch(page, /noindex/);
	const root = read('index.html');
	assert.match(root, /<link rel="canonical" href="https:\/\/website\.example\/">/);
	assert.match(root, /hreflang="x-default" href="https:\/\/website\.example\/"/);
	// The 404 page answers for every unknown address, so it has no address of its own.
	assert.match(read('404.html'), /noindex/);
	assert.doesNotMatch(read('404.html'), /rel="canonical"/);
	assert.equal(read('sitemap.xml').match(/<url>/g)?.length, 6);
	for (const path of ['/privacy', '/zh-Hant/privacy', '/zh/privacy']) {
		assert.ok(read('sitemap.xml').includes(`<loc>https://website.example${path}</loc>`));
		const policy = read(`${path.slice(1)}.html`);
		assert.ok(policy.includes(`<link rel="canonical" href="https://website.example${path}">`));
		assert.match(policy, /hreflang="en" href="https:\/\/website\.example\/privacy"/);
		assert.match(policy, /hreflang="zh-Hant" href="https:\/\/website\.example\/zh-Hant\/privacy"/);
		assert.match(policy, /hreflang="zh-Hans" href="https:\/\/website\.example\/zh\/privacy"/);
		assert.match(policy, /hreflang="x-default" href="https:\/\/website\.example\/privacy"/);
		assert.doesNotMatch(policy, /noindex/);
	}
	assertPrivacyPages(read);
	assert.match(read('robots.txt'), /Sitemap: https:\/\/website\.example\/sitemap\.xml\n/);
	assert.match(read('robots.txt'), /Sitemap: https:\/\/website\.example\/docs\/sitemap-index\.xml\n/);
});

/** The policy must be a complete public HTML document, even without client JavaScript. */
function assertPrivacyPages(read: (file: string) => string) {
	for (const [home, policyPath, lang, title, retention] of [
		['en', 'privacy', 'en', 'Privacy policy', 'indefinitely'],
		['zh-Hant', 'zh-Hant/privacy', 'zh-Hant', '隱私權政策', '永久保存'],
		['zh', 'zh/privacy', 'zh-Hans', '隐私权政策', '永久保存'],
	]) {
		const page = read(`${policyPath}.html`);
		assert.ok(read(`${home}.html`).includes(`href="/${policyPath}"`));
		assert.ok(page.includes(`<html lang="${lang}"`));
		assert.ok(page.includes(`<h1>${title}</h1>`));
		assert.match(page, /<article[^>]*>[\s\S]*willie6666[\s\S]*<\/article>/);
		assert.doesNotMatch(page.match(/<article[^>]*>[\s\S]*<\/article>/)![0], /\*\*/, 'Markdown emphasis must render in every language');
		assert.match(page, /mailto:balnana\.com@gmail\.com/);
		assert.match(page, /href="https:\/\/app\.balnana\.com\/delete-account"/);
		assert.match(page, /AWS SES/);
		assert.ok(page.includes(retention));
		assert.doesNotMatch(page, /location\.replace\(|contenteditable/);
		for (const path of ['/privacy', '/zh-Hant/privacy', '/zh/privacy']) {
			assert.ok(page.includes(`href="${path}"`), `Language switch on /${policyPath} must stay on the policy`);
		}
	}
}

test('SITE_URL must be a bare origin', () => {
	for (const url of ['javascript:alert(1)', 'https://example.com/path', 'https://user:pass@example.com', 'https://example.com?key=secret']) {
		assert.ok(!build(url).ok, url);
	}
});
