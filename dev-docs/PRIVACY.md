# Official privacy policy

Effective date: 2026-11-17. Policy content is based on the operator's answers and a read-only audit of the sibling `../balnana` application/server checkout on that date. This file is not published.

## Public addresses

- `https://balnana.com/privacy` — English; fixed store-listing address, no language redirect.
- `https://balnana.com/zh-Hant/privacy` — Traditional Chinese.
- `https://balnana.com/zh/privacy` — Simplified Chinese.

All are prerendered HTML, without authentication or a JavaScript requirement for reading. The static site has no location-based access rule. Production availability, TLS, Cloudflare access controls and reachability still depend on the deployed infrastructure.

## Operator-confirmed facts

- App: Balnana. Developer and official operator: willie6666.
- Public privacy contact: balnana.com@gmail.com.
- Scope: Android app, app.balnana.com and balnana.com. Other server operators are responsible for their own policies and server-side processing.
- Official hosting: self-managed server in Taichung, Taiwan; AWS S3 Taipei storage/backups. Service email: AWS SES.
- Server logs and database backups: retained indefinitely. Existing backup copies are not automatically purged by application-level deletion.
- No sale of data, advertising use, or proactive administrator review of user content.
- Intended audience: ages 16 and older, with local age/parental-authorization requirements still applying. This is an audience decision, not a claim that the software verifies ages or a substitute for the Play content-rating questionnaire.

## Code audit

Paths below are relative to the sibling application repository.

| Area | Evidence and policy consequence |
| --- | --- |
| App policy links | `app/lib/features/settings/privacy_page.dart`: opens the server's `privacyUrl`, with a built-in fallback; both sign-in and About use the existing privacy entry point. |
| Account deletion | `server/internal/api/account.go`, `deleteAccount`: removes the user, detaches members, and deletes groups inaccessible to other accounts unless link access remains. Shared member names and ledger content remain. Account-related cascading deletion is defined in `server/migrations/`. |
| Group and receipt retention | `server/internal/api/sweep.go`: 30-day archive retention and deleted-expense receipt retention; an hourly cleanup deletes live-database records. `groups.go` archives a deleted group. `receipts.go` deletes an explicitly removed receipt immediately. |
| Deleted expense history | `server/internal/api/expenses.go`: soft deletion is restorable; the cleanup does not delete the expense record itself after 30 days. Do not claim every expense is erased after 30 days. |
| Receipt collection | `app/lib/features/expense/receipt.dart`: user-selected camera/gallery input; `requestFullMetadata: false`. `server/internal/api/receipts.go`: resize and JPEG conversion; binary images are stored in the database. |
| Location | `app/lib/features/expense/location.dart`, `app/lib/core/location_io.dart`, Android location code and `AndroidManifest.xml`: location is requested on a user action, with no background-location permission; confirmed coordinates/name are part of an expense. External map opening sends coordinates. |
| Map services | `server/internal/config/config.go`, `app/lib/features/expense/location.dart`: OpenFreeMap default vector style and OpenStreetMap fallback tiles, fetched by the client. Providers receive IP/requested map area. |
| Authentication | `server/internal/api/auth.go`, `oauth.go`, `oauth_choice.go`, `apple.go`: password hashes, sessions, Google/OIDC identity claims, optional profile-picture URL; Sign in with Apple (iOS only, with `BALNANA_APPLE_BUNDLE_ID`): Apple subject, shared or private-relay email, first-time name. Google support in code does not establish that it is currently enabled. |
| Push | `app/lib/core/push.dart`, `push_web.dart`, `server/internal/api/push.go`, `server/internal/push/webpush.go`: installation identifiers/endpoints/keys, Google FCM or user-selected UnifiedPush distributor, browser Web Push, encrypted notification payloads. |
| Payments | `app/android/app/src/play/kotlin/com/balnana/app/PlayBilling.kt`, `server/internal/api/play.go`, `appstore.go`, `paypal.go`, payment handlers and migrations: Google Play, App Store (Apple-signed StoreKit 2 transactions and Server Notifications V2, `appstore_subscriptions`, derived `appstore_account_token`), PayPal and Ko-fi features; transaction/entitlement records; no direct full-card collection in the purchase flow. Payment events survive account deletion with `user_id` set to null. |
| Payment retention | `server/internal/api/sweep.go`, `server/internal/config/config.go`: `BALNANA_PAYMENT_KEEP_DAYS` can remove payer email/name after a configured number of days; its default is 0 (no automatic removal). Transaction records themselves have no scheduled deletion. No production value was assumed. |
| Logs and network data | `server/internal/api/handler.go`: debug request logs contain method, masked path, status and duration, without query strings. `ratelimit.go`: IP-based rate limiting. Application code does not set infrastructure-log or backup expiry. |
| Local storage | `app/lib/core`, `app/lib/data`, Android manifest, website `Header.astro`, `index.astro`, and demo: local offline copies/session/preferences; Android app backup disabled; website language/theme local storage and local-only demo. |
| Website hosting | `wrangler.jsonc` and `dev-docs/DEPLOYMENT.md`: official website is hosted on Cloudflare Workers static assets. |

The public, unauthenticated `https://app.balnana.com/api/v1/server-info` response checked on 2026-11-17 advertised accounts, password/email, link groups, push, OpenFreeMap, PayPal and Ko-fi. It had no `privacyUrl` and an empty `oauthProviders` list. The policy describes Google sign-in and Play purchases conditionally, rather than claiming every supported feature is enabled in production.

## Release configuration

After the website is deployed, set the **official server's** `BALNANA_PRIVACY_URL` to `https://balnana.com/privacy`, or set the matching field in the existing `/admin` interface. This connects the app's sign-in/About privacy entry points to the published policy. This website change does not modify production server configuration or self-hosting defaults.

Use `https://balnana.com/privacy` in the Play Console privacy field and `https://app.balnana.com/delete-account` in its external account-deletion field. The policy is public; actually deleting an account appropriately requires authentication. Verify the published policy routes return HTML without login, geographic restrictions or invalid TLS. Configure the Play target audience accurately for the intended 16+ audience and complete the separate content-rating and Data safety forms based on actual behavior.

## Deletion limitations requiring operational work

Publishing a policy does not change deletion behavior. Indefinite personal-data retention in backups/logs, shared content remaining after account deletion, and payer name/email surviving account deletion need to be considered against the Google Play user-data/account-deletion requirements and applicable law. Disclosure alone does not establish compliance or guarantee review approval. The policy accurately describes these limits rather than claiming all data is removed after 30 days.

Before submission, establish and implement how deletion requests are handled across live data, shared records, logs and backups, including any necessary and justified retention. No backup lifecycle, production retention setting, app/server source, or existing user data was changed in this website task.

References: [Google Play User Data](https://support.google.com/googleplay/android-developer/answer/10144311?hl=en), [target audience](https://support.google.com/googleplay/android-developer/answer/9867159?hl=en), [Astro Markdown](https://docs.astro.build/en/guides/markdown-content/).
