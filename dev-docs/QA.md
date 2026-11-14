# Implementation verification — 2026-10-30

Environment: Flutter 3.47.8, Dart 3.13.7. Target: release-mode Flutter Web, served locally. The original `/home/willie/storage/balnana` checkout remains unchanged.

## Automated checks

- `flutter analyze`: no issues.
- `flutter test`: 29 tests pass. Includes all 20 locales at 360, 390, 768, 1024 and 1440 logical pixel widths; 320px with 200% text scaling for English, German, Arabic and Traditional Chinese; interactive amount/payer/reset behavior; zero-obligation state; and theme/language persistence.
- Domain checks verify exact minor-unit allocation, balance conservation, and suggested transfers that bring every member to zero, including rounding edge cases.
- Localized number parsing checks English, German, Arabic and Devanagari input, precision and amount bounds. It also accepts either decimal separator when unambiguous (`12.5` in German, `12,5` in English), French/Polish/Russian space grouping (including U+202F), Indian lakh grouping, and grouped zero-decimal currencies; malformed grouping is rejected, and amounts above 1,000,000 report a dedicated "too large" message instead of a generic error.
- `python3 tool/check_locales.py`: all 20 locales match the App inventory, with 92 nonempty messages per locale and matching placeholders.
- `python3 -m unittest test_web_metadata.py`: 2 tests pass for localized document generation, preview/production metadata transitions, sitemap counts and invalid origin rejection.
- `bash tool/build.sh` with the pinned SDK: release build passes and produces `build/web` with 20 locale entry documents. The local output intentionally uses preview/noindex settings.

## Browser checks

Verified in the Codex in-app browser against the release build:

- Traditional Chinese homepage and light/dark appearance changes.
- A JPY 16,000 equal split gives the payer JPY 12,000 back and three JPY 4,000 payments. Switching the payer updates the correct person's balance.
- Weighted splitting assigns Alex two shares and the others one; with Jamie paying JPY 16,000, Jamie receives JPY 12,800 and the other amounts are JPY 6,400 / 3,200 / 3,200.
- Changing to the flatmates scenario resets the example to EUR with two fractional digits.
- Searchable language picker switches the page and URL to Arabic; the layout reads right to left while currency values remain legible.
- Real App screenshots open in an enlarged dialog, with a translated close action.
- The offline FAQ expands to the accurate Android read-only-cache explanation.
- Direct `#demo` entry, refresh and browser back/forward preserve the expected locale/section. Hash inclusion is explicitly enabled in `PathUrlStrategy`.
- Mobile layout is visually checked in the browser in addition to the automated width matrix.
- Cold deep links such as `/en#hosting` and `/de#demo` land on the section after fonts and images settle.
- The hosting band stays visually distinct from the page in dark mode.
- Entering `12.5` in the German EUR scenario is read as 12,50 € (Alex receives 9,37 €).

Saved captures are in `dev-docs/qa/`. They show the actual Flutter application, not the original SVG concepts.

## Remaining verification scope

The work has not been deployed to Cloudflare or run by GitHub Actions. A real production origin and deployment credentials are still required for publication. No iOS/Safari run, full screen-reader audit, comprehensive performance benchmark, or native-speaker review of every translation is claimed.
