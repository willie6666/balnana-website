# Balnana Official Website Design Plan

Date: 2026-10-30 · This document preserves the original design proposal. The Flutter website is now being implemented; see the [README](README.md) for the latest features, verification, and how to run it. Nothing is deployed yet.

Research source: `/home/willie/storage/balnana`, commit `c869ad9`. This plan is based on the README, the implementation code, `docs/DESIGN.md`, `docs/PLAN.md`, the ARB language files, and the existing Android demo screenshots.

## 1. Goals and positioning

On the first screen, someone new to Balnana should understand three things: it is a group expense-splitting tool, it reduces the number of transfers needed to settle up, and the data lives on a server the group manages.

Primary use cases: friends traveling together, housemates sharing rent, dining out, and everyday shared expenses. The secondary audience is people who want to self-host the service for friends or family.

Suggested brand statement:

> **Good times. Clear balances.**
>
> Trips, dinners, shared housing: Balnana keeps shared expenses organized and balances clear.
> Splitting gets easier, and the data stays in your hands.

The Traditional Chinese tagline is 一起玩，輕鬆算清。

The goal is to get visitors to try the splitting demo, then learn how to self-host and get the app. The project README currently describes it as early development, preparing for a first release; the first version of the site should state the development status honestly.

## 2. Visual direction: Warm balance

Keep the app's brand identity and turn it into large-scale web typography.

| Element | Design rule |
| --- | --- |
| Primary color | Keep the banana yellow seed `#E8A800`, used for primary buttons, selected states, and graphics |
| Light | Warm white background, beige layers, dark brown-black text; avoid full-bleed saturated yellow |
| Dark | Warm charcoal background, low-lightness surfaces, soft golden accents; derive the tonal steps from the app's dark scheme |
| Typeface | Keep Plus Jakarta Sans; add suitable fallbacks for Chinese and other scripts |
| Shapes | 16 / 24 / 32 corner radii, pill buttons, circular person initials, clear numerals |
| Semantic colors | Keep the green for receivable and red for payable, always paired with a sign and a text description |
| Whitespace | Larger section spacing on desktop; content about 1200px wide, long-form reading column about 720px |
| Brand graphic | Extend the logo's double semicircle into a banana arc that connects "expense → balance → settled" |
| Imagery | Real UI and demo data first; key people use the app's circular initials avatars |

Concept mockups:

- [Desktop light](design/home-desktop-light.png)
- [Desktop dark](design/home-desktop-dark.png)
- [Mobile](design/home-mobile.png)

These are static direction studies. Their copy, numbers, and cards are for evaluating visual hierarchy; they are not finished Flutter components. The dark cards in the mockups are website demos drawn in the app's style, not real dark-mode device screenshots. Colors and font fallbacks will be compared item by item against the real theme in the first Flutter version.

## 3. Homepage content and interaction

| Order | Section | Content and purpose |
| --- | --- | --- |
| 1 | Top navigation | Logo, Features, Split demo, Self-host, GitHub, language, appearance; on mobile keep language/appearance access and fold the rest into a menu |
| 2 | Hero | Large headline and a short description; the primary CTA "Try splitting" jumps to the interactive demo on this page, and the secondary CTA "Self-host" jumps to the self-hosting section |
| 3 | Trust strip | Open source, self-hostable, no app ads; Android + Web; the in-development marker sits near the CTA |
| 4 | Scenario-based splitting demo | Switch between travel / housemates / dining; shows expenses, each person's balance, and suggested transfers. Visitors can change one payer or amount and watch the result update |
| 5 | Three main benefits | Flexible splitting, clear settlement, data under your control; use display panels of different widths to avoid a stack of repeated small cards |
| 6 | Traveling together | Tell the story of a Kyoto weekend: expense list, different currencies, category statistics; alternating image and text on desktop, vertical on mobile |
| 7 | Full features | Multiple payers, equal / exact amount / shares splitting, recurring expenses, receipts and locations, live updates, import and export |
| 8 | Your group, your server | A simple diagram of Android / Web connecting to your own Balnana server; distinguishes the no-signup link mode from the account mode |
| 9 | Get started | Regular users join an already hosted service; self-hosters open the full docs. For the first launch, the source code and self-hosting docs are the real destinations |
| 10 | FAQ | Is an account required, does it work offline, how are exchange rates handled, is it free, is iOS supported, how the website relates to the data server |
| 11 | Footer | Source code, issue reporting, self-hosting guide, license information, project status |

### Creative details to show

- **Balances converging**: arcs between people turn into suggested payment paths, visualizing settlement. It only expresses the payment relationships in this demo and does not imply the algorithm guarantees the mathematically minimal number of transfers.
- **Scenarios switch together**: switching travel / housemates / dining changes the ledger name, categories, currency, and copy while keeping the same interaction.
- **Live theme preview**: when the site switches between light and dark, the Flutter-drawn demo cards change color too; real screenshots without a matching dark version keep their real look and say so.
- **Currency mini-story**: the original USD expense and the JPY amount received are shown side by side and explained with the rate or received amount actually entered, with no illusion of live exchange rates.
- **Subtle entrance**: 150 / 300 / 450ms as the base; no continuous rotation, forced parallax, or scroll hijacking. Respect the system reduce-motion setting.

### Data rules for the splitting interaction

This is a frontend-only demo. It does not connect to a user's Balnana server and does not create real groups.

The first version uses four fictional people and a small number of editable expenses, and supports only the split methods the product already has. Amounts use integer minor units or BigInt; total spending, payments, shares, balances, and suggested payments must be consistent. Invalid amount input is reported with an in-place message, and the demo has a reset action.

The visuals can be completed first with fixed fixtures, with live calculation added afterwards. The interaction may only claim behavior that is implemented on the website and covered by tests.

## 4. Feature copy and implementation checks

| What the website may describe | Basis | Boundary to keep |
| --- | --- | --- |
| Equal, exact-amount, and share-based splitting; multiple payers | `app/lib/features/expense/expense_editor_page.dart`, domain split | Do not add a percentage split mode that is not implemented |
| Settlement suggestions that reduce transfers | `docs/PLAN.md`, `server/internal/domain/` | n non-zero balances need at most n−1 payments; do not claim a global minimum |
| Foreign-currency expenses, one currency per group | expense editor, `docs/PLAN.md` | Manual rate or actual received amount; no live exchange rates; recurring expenses and transfers use the group currency |
| Viewing offline on Android | `app/lib/core/offline_cache.dart` | Cached data, read-only; do not claim offline creation or sync of writes, or offline Web |
| Share link or QR code | `app/lib/features/group/share_sheet.dart` | No signup applies to link mode; account mode depends on the server and group settings |
| Password, Google, and OIDC sign-in | account features, server configuration | Enabled by the host; not guaranteed on every public server |
| Live updates, Android UnifiedPush | live / push implementation | Web push is not implemented; notifications depend on server and device configuration |
| Category / member / month statistics | `app/lib/features/group/spending_tab.dart` | The real UI is currently a bar chart; do not describe the concept pie chart as implemented |
| CSV export, Settle Up import | import page, API, `docs/PLAN.md` | Do not claim that every similar app's format can be imported |
| Recurring expenses, receipts, locations | recurring page, receipt / location | Map and service settings are managed by the host |
| Self-hosting, open source | README, `docs/SELF_HOSTING.md` | Cloud or hosting may still cost money; do not say data is end-to-end encrypted or that there are no third-party connections |
| Android and Web | README, pubspec, platform directories | Do not show unverified iOS / App Store / Play Store download badges |

Download links, version numbers, a live demo host, and a real domain are not assumed for now. The first version uses the [GitHub project](https://github.com/willie6666/balnana), which is known to exist, and its self-hosting instructions; verify release assets and compatibility when the app is actually released.

## 5. Localization: the same 20 languages as the app

The 20 ARB files were checked, and each currently has 784 non-metadata message entries. The website needs its own marketing copy; the app's UI translations cannot simply be treated as the website's translations.

| App locale | URL tag | Language menu name |
| --- | --- | --- |
| `en` | `en` | English |
| `zh` | `zh` | 简体中文 |
| `zh_Hant` | `zh-Hant` | 繁體中文 |
| `ja` | `ja` | 日本語 |
| `ko` | `ko` | 한국어 |
| `es` | `es` | Español |
| `fr` | `fr` | Français |
| `de` | `de` | Deutsch |
| `pt` | `pt` | Português |
| `it` | `it` | Italiano |
| `ru` | `ru` | Русский |
| `uk` | `uk` | Українська |
| `pl` | `pl` | Polski |
| `nl` | `nl` | Nederlands |
| `tr` | `tr` | Türkçe |
| `vi` | `vi` | Tiếng Việt |
| `id` | `id` | Bahasa Indonesia |
| `th` | `th` | ไทย |
| `ar` | `ar` | العربية |
| `hi` | `hi` | हिन्दी |

Rules:

- Use Flutter's official ARB / `gen-l10n` workflow, with English as the template. Translations cover all visible text, accessibility labels, the FAQ, error messages, and share metadata.
- On the first visit to the root: explicit URL language > saved language > browser preference > English. A shared URL that names a language takes priority and is not overridden by device settings.
- `zh-TW`, `zh-HK`, and `zh-MO` map to `zh-Hant`; `zh-CN` and a plain `zh` without a script map to Simplified Chinese, consistent with the app's logic.
- The language menu shows native names and no flags; the desktop menu supports scrolling/search, and mobile uses a sheet.
- Arabic uses RTL with directional padding/alignment; currency codes, URLs, and code keep correct LTR display.
- Use localized date and number formats, and do not force the JPY demo data into the user's local currency.
- Do not load large fonts for every writing system at once; first validate system fallbacks and the per-language font subsets that are actually needed.
- CI compares the website's language list with the available app locale inventory and checks for missing strings, placeholders, and plurals; a 20-language smoke check is not the same as native-speaker proofreading.

## 6. Appearance, layout, and accessibility

Appearance options: **Follow system / Light / Dark**. The first visit follows the system, and an explicit choice is saved in the browser; system mode must respond live to browser appearance changes. The loading screen uses the same choice as Flutter to avoid a white flash.

| Width | Layout |
| --- | --- |
| 360–599 | Single column, hero text before the demo card; CTAs can wrap; no forced horizontal scrolling |
| 600–959 | Mixed one/two columns, collapsed navigation, demo cards stay within the content column |
| 960 and up | Two-column hero, alternating image and text for features, a maximum content width |

Acceptance covers 360 / 390 / 768 / 1024 / 1440, plus a 320px overflow check. Long German, Arabic, Thai, and 200% text scaling must not cover the CTAs. Text is never converted to images.

The design acceptance targets are WCAG AA contrast, visible keyboard focus, a sensible reading order, and primary action targets of at least 48px; screen reader behavior is verified with Flutter Semantics. Values carry text and a sign, so meaning never depends on red/green alone. These are targets still to be verified; the plan does not claim the existing app or the concept mockups fully pass.

## 7. Flutter implementation architecture

The website lives separately in `/home/willie/storage/balnana-offical-web`, stays frontend-only, and can be deployed statically. Use a pinned Flutter SDK version compatible with the app; when implementation starts, confirm package versions from the SDK and pubspec.

Suggested structure:

```text
lib/
  app.dart
  core/          # appearance, locale, navigation, persisted preferences
  design/        # theme, typography, spacing, motion, reusable controls
  features/
    home/        # hero, benefits, travel story, FAQ, getting started
    demo/        # fixtures, integer calculations, scenario UI
  l10n/          # site_en.arb + all 19 translations
assets/
  brand/
  screenshots/
  fonts/
web/             # bootstrap, metadata, icons, hosting headers
tool/            # locale inventory checks, metadata/sitemap generation
test/            # demo maths, locale/theme persistence, critical layout checks
```

Brand tokens, the logo, and OFL fonts can be reused, but the app's business code is not brought into the website wholesale. The website needs no PostgreSQL, Go API, authentication, or real ledger data. The demo calculation extracts only the necessary pure functions or a trimmed implementation with shared test vectors; where original code is reused, keep the license and attribution.

URL direction: language paths such as `/en/` and `/zh-Hant/`; homepage sections can use shareable section state, and implementation should verify back/forward/refresh and scroll positioning. Unknown paths show a not-found page with navigation, an unknown language falls back sensibly, and not every bad path is treated as a valid language homepage.

## 8. Cloudflare Pages deployment plan

Build the Flutter website into static output first, then deploy it to Pages; the official build output is `build/web`. This plan is composed from Flutter's and Cloudflare's static deployment capabilities, and does not assume a built-in Flutter preset in Cloudflare.

Suggested flow:

1. Finish Flutter QA locally and pin the SDK and dependencies.
2. CI runs the locale checks, the necessary tests, `flutter analyze`, and `flutter build web --release`.
3. Put the metadata, sitemap, robots, and any needed hosting files into the final output, and confirm that language paths and static assets resolve.
4. Deploy the same `build/web` output with Cloudflare Pages Direct Upload; CI can manage the build, and the domain can be configured later.
5. The real domain and account information come from the actual setup; verify canonical/noindex separately for preview and production.

The alternative is Pages Git integration with explicit Flutter SDK install/build steps. Decide which to use before creating the Pages project: Cloudflare's documentation says a Direct Upload project cannot later be switched to Git integration directly, and a new project is needed.

Do not put the Balnana ledger server into the website deployment: the Go + PostgreSQL self-hosted service keeps running independently.

Deployment acceptance:

- Deep language paths open and refresh directly; follow the Pages SPA fallback rules, and if a root `404.html` is added, reconfirm the routing strategy.
- Start with Pages' default caching and do not put long-lived immutable cache headers on JS/HTML without content hashes; after consecutive deployments, verify that versions are not mixed.
- Check the mobile first screen, fonts, and the request sizes and startup time of the Flutter engine/JS/Wasm before deciding whether to adopt Wasm; do not declare mobile a pass just because desktop is smooth.
- Prepare screenshots at an appropriate resolution and compression, and defer loading below the second screen; do not preload four full-size device images on the first screen.
- Check 404s, external links, share thumbnails, all languages, and both themes.

## 9. Practical limits of search and sharing

Flutter's documentation says its web output favors interactive apps, and search engines do not index its content as easily as regular document-style HTML. Using Flutter satisfies the brand and interaction needs, but it should not be treated as a complete SEO solution.

While keeping the Flutter main UI, the first version covers: a physical entry page per language with title/description, `lang`/`dir`, canonical, hreflang, Open Graph/Twitter metadata, public URLs, a sitemap, and genuinely readable loading/error states. URLs and metadata are generated at build time; changing the head only after Flutter starts is not enough for most share-preview bots.

These measures improve sharing and basic discovery, but do not guarantee the full body text is indexed; Semantics cannot be treated as SEO either. If organic search later becomes a main traffic source, evaluate a combination of a public HTML content layer or article pages with embedded Flutter interaction, and decide its scope separately; do not change the technology unilaterally at this stage.

## 10. Implementation order and completion criteria

| Phase | Deliverable | Completion criteria |
| --- | --- | --- |
| A — Design baseline | This plan, the locale inventory, desktop/mobile light and dark direction mockups | Feature claims are grounded, the information architecture is clear, the visuals can be evaluated |
| B — Flutter homepage | Theme, responsive navigation, hero, demo cards, main content, English and Traditional Chinese first | Usable on desktop/mobile; appearance and language persist; no fake CTAs |
| C — Interaction and assets | Splitting demo, full features/FAQ, real-device assets for both themes | Calculations are correct and reset works; all demo data is fictional; real screenshots have sources |
| D — All languages and QA | 20 languages, RTL, scaling, keyboard/screen reader, performance and build | Missing-translation check passes; every language can be switched to; no overflow in key layouts |
| E — Pages launch prep | CI, static output, metadata, cache/routing verification, deployment notes | A reproducible release build and a deployable `build/web`; the actual deployment is future work |

The first round of implementation concentrates on the desktop and mobile hero plus one working demo, then completes the rest of the page downward. Do not translate 20 copies of long text that is not yet final.

Product information still to be determined: the real domain, the published Android install source, whether there is a public demo server, and the issue reporting/contact entry point. None of these block design and local implementation; a configurable real GitHub entry point is enough for the first version.

## 11. Research and assets

- App brand: `app/lib/ui/theme.dart`, `colors.dart`, `tokens.dart`, `app/web/icons/logo.svg`.
- Features and limits: README, `docs/PLAN.md`, `docs/SELF_HOSTING.md`, and the corresponding implementation.
- Source of the 20 languages: `app/lib/l10n/app_*.arb`, `app_localizations.dart`; see the snapshot in [locale-inventory.json](dev-docs/locale-inventory.json).
- Existing demo screenshots: `assets/screenshots/{expenses,balances,statistics,foreign}.png`; the README states clearly that they use fictional data.
- Emulator observation on 2026-10-30: the foreground app was `me.devvillie.balnana` showing "Group not found", so it cannot be used directly as a homepage feature image; no group, language, or theme was changed. Reconnect to a dedicated demo server and capture again later.
- Reusing the app's fonts requires keeping the OFL; reusing original code or brand assets requires checking the original project's AGPL-3.0-only license and the related asset licenses, and the website's own terms of use / privacy notice should describe what the website actually does.

## 12. Documentation check

On 2026-10-30 the official Flutter documentation was queried with the Context7 CLI, and the following official pages were checked:

- [Flutter Web FAQ: use cases and SEO](https://docs.flutter.dev/platform-integration/web/faq)
- [Build and release a web app (Flutter)](https://docs.flutter.dev/deployment/web)
- [Flutter internationalization](https://docs.flutter.dev/ui/internationalization)
- [Cloudflare Pages Direct Upload](https://developers.cloudflare.com/pages/get-started/direct-upload/)
- [Cloudflare Pages build configuration](https://developers.cloudflare.com/pages/configuration/build-configuration/)
- [Cloudflare Pages SPA, routing, and caching](https://developers.cloudflare.com/pages/configuration/serving-pages/)

This phase only produced the design document and static mockups; it does not claim that the Flutter build, interaction tests, full translation, or online deployment is complete.
