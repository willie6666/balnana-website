# Deploying to Cloudflare Workers

This is a static website: an Astro homepage with Starlight docs under `/docs`. It does not include the Balnana Go server or PostgreSQL database.

It is served by a Cloudflare Worker with static assets and no Worker script. `wrangler.jsonc` names the Worker `balnana-website` and points it at `build/web`. Cloudflare **Workers Builds** is connected to the GitHub repository, so Cloudflare builds and deploys on every push. There is no GitHub Actions workflow.

## Build

Use Node.js 24 or later (`.node-version` pins 24 for Workers Builds too). From the project root:

```bash
npm install
npm run build
```

`tool/build.sh` runs `npm ci` in `site/` and `docs-site/`. It type-checks the homepage and runs its tests, then builds the homepage into `build/web` and the docs into `build/web/docs`. A failing check or test stops the build, so the deploy step never runs.

Production builds are a Workers Builds run on `main` (detected from `WORKERS_CI_BRANCH`) or `bash tool/build.sh --production`. They set `SITE_URL`, which defaults to `https://balnana.com`. Any other build is a noindex preview, unless you set `SITE_URL` yourself. `SITE_URL` must be a root origin, without a subpath or credentials.

A preview build emits `noindex` pages and a disallowing robots.txt, and so do the docs. With the origin, the homepage gets:

- canonical URLs
- hreflang entries for `en`, `zh-Hant` and `zh-Hans`, plus x-default
- absolute Open Graph addresses
- sitemap.xml and an allowing robots.txt

The docs get canonical URLs and `/docs/sitemap-index.xml`, which robots.txt lists.

## One-time Cloudflare setup

1. **Create the Worker and connect the repository.** In the Cloudflare dashboard, go to **Workers & Pages > Create > Import a repository** and pick `willie6666/balnana-website`. If a Worker named `balnana-website` already exists, open it and use **Settings > Builds > Connect** instead. Use these settings:

   | Setting | Value |
   | --- | --- |
   | Production branch | `main` |
   | Build command | `npm run build` |
   | Deploy command | `npx wrangler deploy` |
   | Root directory | `/` (the repository root) |

   No build variables are needed. Workers Builds installs the root `package.json`, so it uses the pinned Wrangler version. Optionally, under **Settings > Builds**, turn on builds for non-production branches; those builds are noindex previews.

2. **Move the domain from the old Pages project.** `balnana.com` is still attached to the old Pages project `balnana-website`. Under **Workers & Pages > balnana-website (Pages) > Custom domains**, remove `balnana.com`. Then, under **the Worker > Settings > Domains & Routes > Add > Custom domain**, add `balnana.com`. Cloudflare creates the DNS record and certificate. Expect a short gap between the two steps. Once the Worker serves the domain, the old Pages project can be deleted.

## Deploying

- **Normal flow:** push to `main`. Workers Builds runs the build and deploys. Each build's log and status show under the Worker's **Deployments** tab, and on the commit in GitHub.
- **From your machine:** run `npx wrangler login` once, then `npm run deploy`. This builds with `--production` and deploys with Wrangler.
- **Rollback:** go to the Worker's **Deployments** tab and pick an earlier version.

## Routing and caching

- The website is hosted at `/`, with locale routes such as `/en` and `/zh-Hant`.
- Every locale is an actual `<tag>.html` page. With `html_handling: "auto-trailing-slash"`, the Worker serves it at `/<tag>` and redirects `/<tag>.html` there.
- The docs are plain static pages under three folders: `/docs/` (English), `/docs/zh-hant/` (Traditional Chinese) and `/docs/zh-hans/` (Simplified Chinese). Each folder's `index.html` is served, and `/docs` redirects to `/docs/`.
- With `not_found_handling: "404-page"`, unknown addresses get the top-level `404.html` with an HTTP 404 status. The page picks its language in the browser.
- HTML uses Cloudflare's default caching. `/_astro/*` and `/docs/_astro/*` are marked immutable in `_headers`, since those file names carry content hashes.
- `_headers` also sets:
  - `nosniff`
  - the referrer policy
  - `X-Frame-Options: DENY` and `frame-ancestors 'none'`, so the site cannot be framed
  - disabled camera, microphone and geolocation permissions
- The homepage requests nothing from other origins. The Latin brand font is served from `/_astro/`, and Chinese text uses the device's fonts.

`npm run preview` runs the same Worker locally with `wrangler dev` on port 4173, so routing and headers can be checked before pushing.

## Prelaunch verification

Check the following on the real domain:

- locale deep links and browser refresh
- theme persistence
- mobile demo inputs
- screenshot enlargement and FAQ expansion
- GitHub and setup links
- social-preview.png, robots.txt and sitemap.xml
- `/docs/`, including its search, its language switch and the theme it shares with the homepage

Also test a second deployment for stale caches.

The translations have complete key coverage, but still benefit from native-speaker review. A full screen-reader audit and an iOS/Safari browser pass remain follow-up work.

## Sources

- [Workers static assets](https://developers.cloudflare.com/workers/static-assets/)
- [HTML handling](https://developers.cloudflare.com/workers/static-assets/routing/advanced/html-handling/)
- [Custom headers](https://developers.cloudflare.com/workers/static-assets/headers/)
- [Workers Builds configuration](https://developers.cloudflare.com/workers/ci-cd/builds/configuration/)
- [Custom domains](https://developers.cloudflare.com/workers/configuration/routing/custom-domains/)
