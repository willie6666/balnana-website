# Balnana official website

The official Balnana introduction site, built with Flutter Web. It has a warm white / banana yellow look with a dark theme, 20 languages, a responsive layout, and a frontend-only expense-splitting demo.

## Local preview

Flutter **3.47.8** / Dart **3.13.7**, Node.js **22.12+**, and Python 3. Dependency versions are recorded in `pubspec.lock` and `docs-site/package-lock.json`.

```bash
flutter pub get
bash tool/build.sh
python3 tool/serve.py
```

Open `http://127.0.0.1:4173/zh-Hant`. If Flutter is not on your PATH, use:

```bash
FLUTTER_BIN=/home/willie/flutter/bin/flutter bash tool/build.sh
```

During development you can also run `flutter run -d web-server` and preview at the URL the terminal prints. The docs site is previewed separately with `cd docs-site && npm install && npm run dev` (`http://localhost:4321/docs/`). This project only targets the web platform, so no Android emulator is needed.

## What is implemented

- Brand homepage, feature overview, an enlarged viewer for real Android screenshots, self-hosting notes, an FAQ, and source code links.
- Travel / housemates / dining demos where you can edit amounts, switch the payer, split equally or by shares, and reset. Amounts are computed in integer minor units and produce suggested payments that settle every balance.
- All 20 of the app's languages, with separate ARB files for the website copy, including Arabic (RTL) and Traditional and Simplified Chinese.
- Per-language URLs, browser back/forward support, and section links. At the root, the language is chosen from the saved preference, then the browser language, then English.
- System / light / dark themes. The preference is stored in the browser, and the loading screen follows the chosen theme.
- Real per-language HTML entry points with metadata, Open Graph tags, and a share image. Once a real domain is provided, the build generates canonical links, hreflang, a sitemap, and robots.txt.

The website demo does not connect to a ledger server and does not create real groups. The product is still marked as in development, and no store download links are invented. The 20 languages have complete copy but have not yet been proofread by native speakers of every language.

## Docs site (/docs)

User documentation is written in Markdown and built with [Astro Starlight](https://starlight.astro.build/) in `docs-site/`. It is output to `build/web/docs/` together with the Flutter homepage:

- Pages live in `docs-site/src/content/docs/` (English) and `docs-site/src/content/docs/zh-hant/` (Traditional Chinese). The sidebar is defined in `docs-site/astro.config.mjs`.
- `docs-site/src/styles/brand.css` applies the same banana yellow palette, Plus Jakarta Sans font, and corner radii as the homepage. The balnana logo in the header links back to the homepage.
- The light/dark preference is shared with the homepage (`flutter.site.theme`), so switching on one side switches the other.
- When adding a page, write one for each language and add it to the sidebar.

`dev-docs/` holds this project's development records (deployment, QA, locale inventory). It is not published.

## Checks and build

```bash
python3 tool/check_locales.py
python3 -m unittest test_web_metadata.py
flutter analyze
flutter test
bash tool/build.sh
```

The tests cover integer splitting, balances and settlement, amount input in each language, the 360 / 390 / 768 / 1024 / 1440 widths for all 20 languages, 320px with 200% text scaling, theme and language persistence, and metadata generation. They are not a comprehensive screen reader or cross-browser compatibility certification.

CI is defined in `.github/workflows/ci.yml`. It installs the pinned Flutter SDK and Node.js, runs the checks and tests, builds the homepage and docs, and stores the site output. It does not deploy automatically.

## Cloudflare Pages

The output folder is `build/web`. Follow the [deployment guide](dev-docs/DEPLOYMENT.md) to use Cloudflare Pages Direct Upload. No Cloudflare account has been connected and nothing has been deployed yet.

Without a real domain, the build defaults to **preview / noindex**. Before going live, set the real domain and build again:

```bash
SITE_URL=https://your-real-domain.example bash tool/build.sh
```

`SITE_URL` must be a bare origin, with no subpath, query, or credentials. The site is deployed at the domain root. The Flutter UI still has limits on how its body text is indexed; metadata and a sitemap do not amount to complete SEO.

## Source layout

- `lib/core/`: languages, appearance preferences, and web metadata syncing.
- `lib/design/`: brand, theme, reusable components, and light/dark widget previews.
- `lib/features/demo/`: the pure calculation model and the interactive demo.
- `lib/features/home/`: the homepage, navigation, features, screenshots, self-hosting notes, and FAQ.
- `lib/l10n/`: 20 ARB files and the localization code Flutter generates.
- `tool/`: build, locale check, metadata, and local preview tools.
- `docs-site/`: the Starlight docs site, published at `/docs`.
- `dev-docs/`: the deployment guide, QA records, and locale inventory.
- `design/`: static concept mockups from the earlier phase, kept for reference.

Translations are maintained in `lib/l10n/site_*.arb`; run `flutter gen-l10n` after changing them.

[QA record](dev-docs/QA.md) · [Original design plan](DESIGN_PLAN.md) · [Asset sources and licenses](NOTICE.md) · [Deployment guide](dev-docs/DEPLOYMENT.md)
