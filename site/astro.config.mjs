// @ts-check
import { writeFile } from 'node:fs/promises';
import { defineConfig } from 'astro/config';

/** The production origin, or undefined for a noindex preview build. */
function origin(value = process.env.SITE_URL) {
	if (!value) return undefined;
	const url = URL.canParse(value) ? new URL(value) : null;
	const bare = url && /^https?:$/.test(url.protocol) && url.pathname === '/' && !url.search && !url.hash;
	if (!bare || url.username || url.password || /[?#]/.test(value)) {
		throw new Error('SITE_URL must be an origin, e.g. https://balnana.example (no path, query or credentials)');
	}
	return url.origin;
}

const site = origin();
const browsers = ['chrome80', 'edge80', 'firefox78', 'safari13'];
const pages = ['/en', '/zh-Hant', '/zh'];

/** Writes robots.txt, and a sitemap once the real origin is known; previews stay out of search. */
const robots = {
	name: 'robots',
	hooks: {
		/** @param {{ dir: URL }} options */
		'astro:build:done': async ({ dir }) => {
			if (!site) return writeFile(new URL('robots.txt', dir), 'User-agent: *\nDisallow: /\n');
			const urls = pages.map((page) => `<url><loc>${site}${page}</loc></url>`).join('');
			await writeFile(
				new URL('sitemap.xml', dir),
				`<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">${urls}</urlset>`,
			);
			// The docs are built into /docs afterwards and bring their own sitemap index.
			await writeFile(
				new URL('robots.txt', dir),
				`User-agent: *\nAllow: /\nSitemap: ${site}/sitemap.xml\nSitemap: ${site}/docs/sitemap-index.xml\n`,
			);
		},
	},
};

export default defineConfig({
	site,
	outDir: '../build/web',
	// Each language is a real file such as en.html, which the Worker serves at /en without a redirect.
	trailingSlash: 'never',
	build: { format: 'file', inlineStylesheets: 'always' },
	vite: {
		// The brand fonts and app screenshots live in the repository's shared assets folder.
		server: { fs: { allow: ['..'] } },
		// Keep the styles and scripts readable by browsers from 2020 on, such as the ones in
		// Android emulator images; the default output assumes much newer ones.
		build: { target: browsers, cssTarget: browsers },
	},
	integrations: [robots],
});
