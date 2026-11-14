# Balnana official website

The official Balnana introduction site and its documentation, both built with [Astro](https://astro.build/) into plain static pages. The homepage has a warm white / banana yellow look with a dark theme, three languages (English, Traditional Chinese and Simplified Chinese), a responsive layout, and an expense-splitting demo that runs in the browser.

The homepage was first written in Flutter Web. It was rewritten as static HTML because the Flutter version downloaded several megabytes before showing anything, drew Chinese text late, and ran poorly on phones.

## Local preview

Node.js **24** or later. Dependency versions are recorded in `package-lock.json`, `site/package-lock.json` and `docs-site/package-lock.json`.

```bash
npm install
npm run build
npm run preview
```

Open `http://127.0.0.1:4173/zh-Hant`. The preview runs the same Cloudflare Worker locally with `wrangler dev`, so it answers exactly like production: `/en` is served from `en.html`, `/docs` redirects to `/docs/`, unknown addresses get the 404 page, and `_headers` applies.

While working on one part, its own dev server reloads on every change:

```bash
cd site && npm install && npm run dev        # homepage, http://localhost:4321/en
cd docs-site && npm install && npm run dev   # docs, http://localhost:4321/docs/
```

## What is implemented

- Brand homepage, feature overview, an enlarged viewer for real Android screenshots, an FAQ, and source code links. The calls to action point to the official server at https://app.balnana.com; self-hosting gets a single section, next to a Ko-fi donation card.
- Travel / housemates / dining sample groups, each with four expenses paid by different people. Pick an expense to edit its amount, switch the payer, or split it equally or by shares; the balances add up across all expenses and the demo compares paying back each bill separately with the combined transfers. Everything can be reset. Amounts are computed in integer minor units and produce suggested payments that settle every balance.
- English, Traditional Chinese and Simplified Chinese. `/zh` is Simplified and `/zh-Hant` is Traditional.
- Per-language URLs and section links such as `/en#faq`. At the root, the language is chosen from the saved preference, then the browser language, then English.
- System / light / dark themes. The preference is stored in the browser and applied before the first paint.
- Each language is a real HTML page with its text, metadata, Open Graph tags, and a share image. Once a real domain is provided, the build adds canonical links, hreflang, a sitemap, and robots.txt.

The page works without JavaScript except for the demo, the theme choice, and the language redirect at the root. Chinese text uses the device's own fonts, so only the Latin brand font is downloaded. The stylesheet and scripts are built for browsers from 2020 on, which includes the ones in Android emulator images.

The website demo does not connect to a ledger server and does not create real groups. The product is still marked as in development, and no store download links are invented. The Chinese copy has not yet been proofread by native speakers.

## Docs site (/docs)

User documentation is written in Markdown and built with [Astro Starlight](https://starlight.astro.build/) in `docs-site/`. It is output to `build/web/docs/`, next to the homepage:

- Pages live in `docs-site/src/content/docs/` (English) and `docs-site/src/content/docs/zh-hant/` (Traditional Chinese) and `docs-site/src/content/docs/zh-hans/` (Simplified Chinese). The sidebar is defined in `docs-site/astro.config.mjs`.
- `docs-site/src/styles/brand.css` applies the same banana yellow palette, Plus Jakarta Sans font, and corner radii as the homepage. The balnana logo in the header links back to the homepage.
- The light/dark preference is shared with the homepage (`balnana.theme` in the browser's storage), so switching on one side switches the other.
- When adding a page, write one for each language and add it to the sidebar.

`dev-docs/` holds this project's development records. It is not published.

## Checks and build

```bash
npm run build
```

`tool/build.sh` type-checks the homepage (`astro check`), runs its tests, builds it into `build/web` and then builds the docs into `build/web/docs`. A failed check or test stops the build, so nothing broken is deployed.

The tests cover integer splitting, balances and settlement, amount input, language resolution, that all three languages have the same messages, and the built pages' metadata in preview and production mode. They are not a screen reader or cross-browser compatibility certification.

## Deployment

The site is a Cloudflare Worker with static assets (`wrangler.jsonc`). Cloudflare Workers Builds is connected to this repository: every push to `main` builds and deploys https://balnana.com, and other branches can build noindex previews. There is no GitHub Actions workflow. See the [deployment guide](dev-docs/DEPLOYMENT.md).

Builds are **preview / noindex** unless they are production builds: a Workers Builds run on `main`, or `npm run deploy` (which builds with `--production` and deploys from your machine). Production builds use `SITE_URL`, defaulting to `https://balnana.com`; it must be a bare origin, with no subpath, query, or credentials.

## Source layout

- `site/`: the homepage.
  - `src/pages/`: one page per language (`[lang].astro`), the root page that redirects to the visitor's language, and the 404 page.
  - `src/components/`: the header and the homepage's sections.
  - `src/demo/`: the calculation model (`ledger.ts`, `amount.ts`) and the script that runs the demo on the page (`demo.ts`).
  - `src/i18n/`: the copy for each language as JSON, and language resolution.
  - `src/styles/global.css`: the palette and all styles.
  - `test/`: tests, run with `npm test`.
- `docs-site/`: the Starlight docs site, published at `/docs`.
- `assets/`: the brand fonts and app screenshots, shared by both sites.
- `tool/`: the build script.
- `wrangler.jsonc`: the Cloudflare Worker that serves `build/web`.
- `dev-docs/`: the deployment guide, plus QA records and a locale inventory from the Flutter version.
- `design/`, `DESIGN_PLAN.md`: concept mockups and the design plan from the Flutter version, kept for reference. The current page keeps their palette and content but not their layout details.

To change the copy, edit `site/src/i18n/*.json`; the tests check that every language has every message.

[Asset sources and licenses](NOTICE.md) · [Deployment guide](dev-docs/DEPLOYMENT.md)
