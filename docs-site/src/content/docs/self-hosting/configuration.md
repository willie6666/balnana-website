---
title: Configuration
description: Email, maps, exchange rates, push notifications, the privacy notice and other server settings.
---

Every setting lives in `.env` (read by `docker-compose.yml`). Settings marked **admin** can also be changed at `/admin`; a variable you set in `.env` wins over `/admin`. With `BALNANA_ENV_ONLY=true`, `.env` is the only place they are read from.

## Server

| Setting | Default | |
| --- | --- | --- |
| `BALNANA_PUBLIC_URL` | `http://localhost:8080` | **admin** · The address people use. Group links are built from it. |
| `BALNANA_PORT` | `8080` | Host port to publish (Compose only). |
| `BALNANA_BIND` | `0.0.0.0` | Host address to publish on. Use `127.0.0.1` behind a local proxy. |
| `BALNANA_LOG_LEVEL` | `info` | `debug`, `info`, `warn` or `error`. |
| `BALNANA_ENV_ONLY` | `false` | `true` reads every **admin** setting from `.env` alone and ignores what was saved at `/admin`. See [Settings from `.env` only](/docs/self-hosting/administration/#settings-from-env-only). |
| `BALNANA_SOURCE_URL` | the Balnana repository | **admin** · Shown under Settings → About → Source code. If you run a modified version, point it at your source. |
| `BALNANA_PRIVACY_URL` | — | **admin** · Your own privacy policy, linked from the sign-in page and Settings → About. Without it the app shows a short built-in notice. |
| `BALNANA_CORS_ORIGINS` | — | Other web origins allowed to call the API. See [connecting the apps](/docs/apps/connecting/#web-app-on-another-origin). |

## Email

Email sends verification, password reset and invitation messages. It is off while `BALNANA_SMTP_HOST` is empty. All of these are **admin** settings.

```ini
BALNANA_SMTP_HOST=smtp.example.com
BALNANA_SMTP_PORT=587
BALNANA_SMTP_USER=
BALNANA_SMTP_PASSWORD=
BALNANA_SMTP_FROM=Balnana <balnana@example.com>
```

Port 465 uses TLS from the start; other ports upgrade with STARTTLS when the server offers it. Emails carry sign-in links, so a mail server that offers no TLS is refused unless it runs on the same machine. `BALNANA_SMTP_ALLOW_PLAINTEXT=true` (in `.env` only) sends to one on your own network anyway, unencrypted.

## Maps

Expenses can carry a place, shown on a map. `BALNANA_MAP_SOURCE` (**admin**) picks where maps come from:

- `style` (default): vector maps from a MapLibre style, `BALNANA_MAP_STYLE`. The default is OpenFreeMap's Liberty style, free and with no key needed.
- `tiles`: raster tiles from `BALNANA_MAP_TILES`, a URL template with `{z}`, `{x}` and `{y}`. The default is OpenStreetMap's own tile server, fine for light use under its [tile usage policy](https://operations.osmfoundation.org/policies/tiles/); busy servers should use a provider or tile server of their own.
- `off`: no maps. Places are kept.

`BALNANA_MAP_ATTRIBUTION` sets the credit shown on every map, as the provider asks.

## Exchange rates

When an expense is paid in another currency, the app starts its rate from the latest one the server looks up. Whatever someone types still wins, and when the server has no rate the app starts from the rate the group used last.

- `BALNANA_EXCHANGE_RATES` (**admin**, default `true`): set `false` to stop looking rates up. People then type every rate themselves.
- `BALNANA_OXR_APP_ID` (**admin**, secret): an [Open Exchange Rates](https://openexchangerates.org/) app ID. Without one, rates come from [Frankfurter](https://frankfurter.dev/), the European Central Bank's free reference rates, which need no key but cover about 30 currencies and change once a working day. With one, they come from Open Exchange Rates, which covers about 170.

The server asks its source at most once an hour, and only when someone picks a currency, so the Open Exchange Rates free plan (1,000 requests a month) is enough. It keeps the last rates in the database, so a restart doesn't ask again, and keeps using them when the source can't be reached.

To get an app ID, sign up for the free plan at [openexchangerates.org/signup/free](https://openexchangerates.org/signup/free), copy the App ID from the dashboard and paste it at `/admin` or set it in `.env`.

## Push notifications

The server notifies phones and browsers when someone adds, changes or deletes an expense or payment they are in, and when someone reminds them to pay. There is nothing to set up: the server makes its own VAPID key the first time it starts and keeps it in the database. `BALNANA_PUSH=false` turns notifications off.

Notifications are standard Web Push messages, encrypted end to end and delivered over [UnifiedPush](https://unifiedpush.org/). A phone with a UnifiedPush distributor such as [ntfy](https://ntfy.sh/) gets them through it. Otherwise the app uses its built-in distributor, which goes through Google's Firebase Cloud Messaging on phones with Google Play services; the app contains no Firebase SDK and needs no Firebase project. People turn notifications on and off per device under Settings → Notifications.

The web app gets them through the browser's own push service, also while no tab is open. It needs the server on `https` (or `localhost`), and is off until someone turns it on under Settings → Notifications, since browsers ask for permission only then. Someone who blocked notifications allows them again in the browser's site settings. On iPhone and iPad, Safari only gets them in the web app added to the Home Screen.

The server only sends to public `https` addresses. A distributor on your own network, such as a self-hosted ntfy at `http://192.168.1.2`, needs `BALNANA_PUSH_PRIVATE_ENDPOINTS=true`.

## Running without Compose

For running the binary directly, `.env.example` also lists `BALNANA_LISTEN`, `BALNANA_DATABASE_URL` (or `DATABASE_URL`), `BALNANA_DATABASE_PASSWORD` and `BALNANA_WEB_DIR` to serve a Flutter web build from disk instead of the embedded one.
