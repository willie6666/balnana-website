---
title: Android release builds
description: Sign release builds with your own key and prepare the app for Google Play or F-Droid.
---

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

`storeFile` may also be relative to `app/android/`. `flutter build apk --release` (or `appbundle`) now signs with that key. Without `key.properties`, release builds stop with an error.

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
- **The release key** for the app bundle: `flutter build appbundle` refuses to build without it. With Play App Signing, add Play's app signing certificate fingerprint to `BALNANA_ANDROID_CERT_SHA256` as well, so [app links](/docs/apps/connecting/#app-links) keep working.
- **The data safety form.** The server stores names, email addresses, the groups' expenses and receipt photos, and (with push notifications) the push service address each phone gives it. Expenses may also contain place names and coordinates. The app asks for location only after "Use current location", and the point is saved only if the person keeps it and saves the expense. Maps load tiles from the operator's provider, which receives the device's network address and the map area requested.

## F-Droid

The app contains no proprietary libraries, so it can be built for F-Droid. Its built-in push distributor still uses Google's Firebase Cloud Messaging as a network service when no other distributor is installed, which F-Droid may label as an anti-feature.
