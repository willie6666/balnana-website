---
title: Two-step sign-in
description: Ask for a code from an authenticator app or by email whenever your password signs in.
---

With two-step sign-in, your password alone no longer signs in to your account: Balnana also asks for a code from an authenticator app, a code sent by email, or either.

**Settings → Two-step sign-in** shows on servers with accounts, for an account that has a password. An account that only signs in with Google or another provider has no use for it: such sign-ins ask for no code, and rely on that provider's own second step.

## Authenticator app

1. Under **Settings → Two-step sign-in**, turn on **Authenticator app** and enter your password.
2. Scan the QR code with your authenticator app, or type the key below it into the app.
3. Enter the six digits the app shows and choose **Turn on**.
4. Keep the eight **Recovery codes** somewhere safe, such as a password manager. They are shown this once only.

Each recovery code signs you in once when you don't have your authenticator app.

Turning **Authenticator app** off asks for your password and ends its recovery codes as well. Turning it on again gives a new key and new codes.

## Code by email

Turn on **Code by email** and enter your password. Balnana then emails a 6-digit code each time you sign in, which works for 10 minutes.

It needs a confirmed email address, and a server that sends email: on one that doesn't, the switch isn't there.

## Signing in

After your password, the sign-in page asks for the code:

- **Authenticator app**: enter the code from your app. A recovery code goes in the same field.
- **Code by email**: when it is the only one on, the code is on its way as soon as your password is accepted. **Email me a code** sends another, at most one a minute. After five wrong tries a code stops working, so ask for a new one.
- Both: either code works. Enter the one from your app, or choose **Email me a code** to get one.

## If you lose your authenticator app

Sign in with a recovery code, or with an emailed code if **Code by email** is on too. Then turn **Authenticator app** off and on again to set up your new phone, which also gives new recovery codes.

:::caution
The server's administrator cannot turn two-step sign-in off for you. Without your authenticator app, a recovery code or an emailed code, you can't sign in with your password.
:::
