#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
flutter_cmd="${FLUTTER_BIN:-flutter}"
python3 tool/check_locales.py
"$flutter_cmd" pub get
"$flutter_cmd" gen-l10n
rm -rf build/web
"$flutter_cmd" build web --release --no-web-resources-cdn
# The Starlight docs live at /docs, next to the Flutter app; SITE_URL also reaches astro.config.mjs.
(cd docs-site && npm ci --no-audit --no-fund && npm run build -- --outDir ../build/web/docs)
if [[ -n "${SITE_URL:-}" ]]; then
  python3 tool/prepare_web.py --site-url "$SITE_URL"
else
  python3 tool/prepare_web.py
fi
