# Visual direction studies

These are static, illustrative design studies, not a Flutter implementation.

- `home-desktop-light.svg` / `.png`: desktop homepage direction in light mode.
- `home-desktop-dark.svg` / `.png`: the same hierarchy in dark mode.
- `home-mobile.svg` / `.png`: mobile hierarchy and stacked feature panels.

The hero card is drawn for the website proposal. It uses the Kyoto demo balances from the App README, which sum to zero. App screenshots in the travel panel retain their original light appearance and contain fictional demo data.

`make_concepts.py` regenerates the SVGs and `dev-docs/locale-inventory.json` from the local Balnana checkout. PNG previews were rendered with `@resvg/resvg-js`, using the App's bundled Plus Jakarta Sans fonts and the system's Noto Sans CJK font. The renderer is a temporary design tool, not a website dependency.

Brand shape and screenshot sources: `/home/willie/storage/balnana/app/web/icons/logo.svg` and `/home/willie/storage/balnana/assets/screenshots/`. The original project is AGPL-3.0-only. Its bundled font's OFL is at `/home/willie/storage/balnana/app/assets/fonts/OFL.txt`.
