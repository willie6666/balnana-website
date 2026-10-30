// @ts-check
import { defineConfig, passthroughImageService } from 'astro/config';
import starlight from '@astrojs/starlight';

// Same origin as the Flutter site; without SITE_URL the build is a noindex preview.
const site = process.env.SITE_URL || undefined;
const repo = 'https://github.com/willie6666/balnana-website';

export default defineConfig({
	site,
	base: '/docs',
	trailingSlash: 'always',
	image: { service: passthroughImageService() },
	// The brand fonts live in the Flutter project's assets.
	vite: { server: { fs: { allow: ['..'] } } },
	integrations: [
		starlight({
			title: { en: 'Balnana Docs', 'zh-TW': 'Balnana 文件' },
			description: 'Run Balnana on your own server and connect the apps.',
			logo: { src: './src/assets/logo.svg', alt: 'Balnana' },
			favicon: '/favicon.svg',
			defaultLocale: 'root',
			locales: {
				root: { label: 'English', lang: 'en' },
				'zh-hant': { label: '繁體中文', lang: 'zh-TW' },
			},
			social: [{ icon: 'github', label: 'GitHub', href: 'https://github.com/willie6666/balnana' }],
			editLink: { baseUrl: `${repo}/edit/main/docs-site/` },
			lastUpdated: false,
			customCss: ['./src/styles/brand.css'],
			components: {
				SiteTitle: './src/components/SiteTitle.astro',
				ThemeProvider: './src/components/ThemeProvider.astro',
			},
			head: site ? [] : [{ tag: 'meta', attrs: { name: 'robots', content: 'noindex, nofollow' } }],
			expressiveCode: {
				themes: ['github-dark-default', 'github-light'],
				styleOverrides: { borderRadius: '0.875rem', codeFontSize: '0.9rem' },
			},
			sidebar: [
				{
					label: 'Self-hosting',
					translations: { 'zh-TW': '自行架設' },
					items: [
						'self-hosting/quick-start',
						'self-hosting/administration',
						'self-hosting/reverse-proxy',
						'self-hosting/access-and-sign-in',
						'self-hosting/configuration',
						'self-hosting/data-and-privacy',
					],
				},
				{
					label: 'Apps',
					translations: { 'zh-TW': 'App' },
					items: ['apps/connecting', 'apps/android'],
				},
				{
					label: 'Guides',
					translations: { 'zh-TW': '使用指南' },
					items: ['guides/import-settle-up'],
				},
			],
		}),
	],
});
