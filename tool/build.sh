#!/usr/bin/env bash
# Tests and builds the whole website into build/web: the homepage from site/, then the docs from docs-site/.
#
# The result is a noindex preview unless it is a production build: `--production`, or a Workers Builds
# run for the main branch. Production builds use SITE_URL, which defaults to the real origin.
set -euo pipefail
cd "$(dirname "$0")/.."

if [[ "${1:-}" == --production || "${WORKERS_CI_BRANCH:-}" == main ]]; then
	export SITE_URL="${SITE_URL:-https://balnana.com}"
else
	export SITE_URL="${SITE_URL:-}"
fi
echo "Building ${SITE_URL:-a noindex preview}"

# A failing type check or test stops the build, so nothing broken is deployed.
(cd site && npm ci --no-audit --no-fund && npm run check && npm test && npm run build)
# The homepage build empties build/web first, so the docs go in after it, under /docs.
(cd docs-site && npm ci --no-audit --no-fund && npm run build -- --outDir ../build/web/docs)
