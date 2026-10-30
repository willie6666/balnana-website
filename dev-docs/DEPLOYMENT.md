# Deploying to Cloudflare Pages

This is a static Flutter website with Starlight docs under `/docs`. It does not include the Balnana Go server or PostgreSQL database.

## Build

Use Flutter 3.47.8 (Dart 3.13.7) and Node.js 22.12 or later. From the project root:

```bash
flutter pub get
python3 tool/check_locales.py
python3 -m unittest test_web_metadata.py
flutter analyze
flutter test
SITE_URL=https://your-real-domain.example bash tool/build.sh
```

`tool/build.sh` also runs `npm ci` and builds `docs-site/` into `build/web/docs`. Replace the example origin with the actual production origin. Do not publish using an example domain. `SITE_URL` must be a root origin, without a subpath or credentials. The output is `build/web`.

Without `SITE_URL`, the build intentionally emits `noindex` entry documents and a disallowing robots.txt for previews. The docs follow the same rule: without `SITE_URL` every page carries `noindex`; with it they get canonical URLs and `/docs/sitemap-index.xml`, which robots.txt lists. With the origin, it also generates localized title/description, canonical URLs, 20 hreflang entries plus x-default, Open Graph, sitemap.xml and robots.txt. The website's visible interface is Flutter; this metadata does not make its full body content reliably indexable.

## Pages project

Choose **Direct Upload** when creating the Pages project. Build on your own machine or CI, then upload the existing `build/web` folder. Flutter is not assumed to be available in a Pages framework preset.

You can use the Cloudflare dashboard's Direct Upload flow or Wrangler:

```bash
npx wrangler@4 pages deploy build/web --project-name=YOUR_PAGES_PROJECT
```

Use your real project name. This command publishes to the selected Pages project; it has not been run as part of the local implementation. Authenticate with your own Cloudflare account. For CI, store API credentials in the CI secret store, never in tracked files. The included GitHub workflow checks/builds/uploads an artifact only; it does not deploy.

Cloudflare says a Direct Upload project cannot later be switched directly to Git integration; a new Pages project would be needed for that mode. Decide the project type before creating it.

## Routing and caching

- The website is hosted at `/`, with locale routes such as `/en` and `/zh-Hant`.
- The docs are plain static pages under `/docs/` (English) and `/docs/zh-hant/` (Traditional Chinese). Pages serves each directory's `index.html` and redirects `/docs` to `/docs/`; the Flutter router never sees these paths.
- Every locale has an actual `<tag>.html` document (served at `/<tag>` without a trailing-slash redirect) so share crawlers can read metadata before Flutter starts.
- Pages SPA fallback handles remaining extensionless routes when there is no top-level `404.html` (the docs' own `404.html` sits under `/docs/`). The Flutter router then displays its own not-found page for unknown paths.
- This SPA fallback may return HTTP 200 for unknown paths. If HTTP-level 404 responses become a requirement, add and test an explicit edge routing strategy.
- Keep Pages default caching. Do not mark unhashed HTML or JavaScript as permanently immutable. The only exception is `/docs/_astro/*`, whose file names carry content hashes.
- The bundled `_headers` configures MIME sniffing, referrer policy and disables camera/microphone/geolocation permissions, which this marketing site does not use.
- Flutter engine resources are bundled by `--no-web-resources-cdn`. Font fallback for scripts missing from the bundled Latin font may still request Flutter's Google-hosted fallback fonts.

## Prelaunch verification

Check the real domain, locale deep links and browser refresh, theme persistence, mobile demo inputs, screenshot enlargement, FAQ expansion, GitHub/setup links, social-preview.png, robots.txt and sitemap.xml, plus `/docs/`, its search, its language switch and the theme shared with the homepage. Test a second deployment for stale caches. Preview deployments should stay noindex; production should use the final canonical origin.

The translations have complete key coverage, but still benefit from native-speaker review. Accessibility and performance have targeted tests; a full screen-reader audit and an iOS/Safari browser pass remain follow-up work.

## Sources checked 2026-10-30

- [Flutter release builds](https://docs.flutter.dev/deployment/web)
- [Flutter initialization](https://docs.flutter.dev/platform-integration/web/initialization)
- [Flutter Web FAQ and SEO](https://docs.flutter.dev/platform-integration/web/faq)
- [Cloudflare Pages Direct Upload](https://developers.cloudflare.com/pages/get-started/direct-upload/)
- [Pages CI deployment](https://developers.cloudflare.com/pages/how-to/use-direct-upload-with-continuous-integration/)
- [Pages serving, SPA routing and caching](https://developers.cloudflare.com/pages/configuration/serving-pages/)
