---
title: Android release builds
description: Pick the build for where the app goes, sign it with your own key, and prepare it for Google Play or F-Droid.
---

## Two builds

The app has two flavors with the same application ID. They differ in how a [plan](/docs/self-hosting/plans-and-payments/) is paid for, and in whether Google's closed billing library is in the APK:

- `foss`, the default: no Google Play billing. For F-Droid and direct downloads, add `--dart-define=BALNANA_EXTERNAL_PAYMENTS=true` to offer Ko-fi and PayPal.
- `play`: sells Google Play subscriptions. It refuses to build with `BALNANA_EXTERNAL_PAYMENTS`, since Google Play doesn't let an app send people elsewhere to pay.

```bash
flutter build appbundle --flavor play
flutter build apk --release --flavor foss --dart-define=BALNANA_EXTERNAL_PAYMENTS=true
```

APKs land in `build/app/outputs/flutter-apk/app-<flavor>-release.apk`.

## Create an upload key

Release builds are signed with your own upload key. Create one once and keep it, and its passwords, safe: every later update must be signed with the same key.

```bash
keytool -genkeypair -v -keystore ~/balnana-upload.jks \
  -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

Then create `app/android/key.properties` (git ignores it):

```properties
storeFile=/home/you/balnana-upload.jks
storePassword=...
keyAlias=upload
keyPassword=...
```

`storeFile` may also be relative to `app/android/`. `flutter build apk --release` (or `appbundle --flavor play`) now signs with that key. Without `key.properties`, release builds stop with an error.

To try a release APK anyway, sign it with the debug key:

```bash
flutter build apk --release --android-project-arg=allowDebugSigning=true
```

:::caution
An APK signed with the debug key cannot update an installed, properly signed app, nor the reverse.
:::

## Publishing checklist

App stores such as Google Play ask for a few things the code cannot supply:

- **A default server.** Build with `--dart-define=BALNANA_SERVER_URL=https://...` so people do not have to type an address on first launch.
- **A privacy policy URL**, public and reachable without signing in: set `BALNANA_PRIVACY_URL` to your policy, or give the store `<server>/privacy`, the built-in notice.
- **An account deletion URL** (accounts mode): `<server>/delete-account`.
- **The release key** for the app bundle: `flutter build appbundle --flavor play` refuses to build without it. With Play App Signing, add Play's app signing certificate fingerprint to `BALNANA_ANDROID_CERT_SHA256` as well, so [app links](/docs/apps/connecting/#app-links) keep working.
- **The data safety form.** The server stores names, email addresses, the groups' expenses and receipt photos, the payment details members add, and (with push notifications) the push service address each phone gives it. Expenses may also contain place names and coordinates. The app asks for location only after "Use current location", and the point is saved only if the person keeps it and saves the expense. Maps load tiles from the operator's provider, which receives the device's network address and the map area requested. On the phone, the app keeps a copy of the groups for offline use, and expenses and payments added offline wait there until they upload. The home screen widget shows the name of the group someone picks and their balance in it.

## F-Droid

The `foss` build contains no proprietary libraries, so it can be built for F-Droid; its recipe has to name the `foss` flavor. Its built-in push distributor still uses Google's Firebase Cloud Messaging as a network service when no other distributor is installed, which F-Droid may label as an anti-feature.
