---
title: Access and sign-in
description: Link mode, accounts mode, sign-up rules, and signing in with Google or any OpenID Connect provider.
---

Balnana has two access modes, set with `BALNANA_AUTH_MODE` or at `/admin`.

## Link mode (default)

A group's private link, or its QR code, is all anyone needs. Nobody signs up.

Link-mode groups live in each device's list of links. **Settings → My group links** copies them all and imports such a list on another device.

## Accounts mode

With `BALNANA_AUTH_MODE=accounts`, people sign in, and a group link only lets signed-in people join the group, claiming one of its members or adding themselves. A group owner can still open a group to anyone with the link, unless `BALNANA_LINK_GROUPS=false`.

| Setting | Default | What it does |
| --- | --- | --- |
| `BALNANA_AUTH_PASSWORD` | `true` | Allow email and password sign-in. |
| `BALNANA_AUTH_REQUIRE_EMAIL` | `true` | When `false`, people sign up with a username instead and sign in with either. |
| `BALNANA_AUTH_SIGNUP` | `open` | Who may register: `open`, `invite_only` or `closed`. |
| `BALNANA_LINK_GROUPS` | `true` | May group owners let people in by link alone. |
| `BALNANA_AUTH_REQUIRE_VERIFIED` | `false` | Keep accounts out of everything but their settings until they confirm their email. Needs [email](/docs/self-hosting/configuration/#email). |

The first account registered on a server can always register, even with `BALNANA_AUTH_SIGNUP=closed`, so a closed server can still be set up.

## Sign in with Google

Register this redirect URI with Google, then set the client ID and secret:

```text
<BALNANA_PUBLIC_URL>/api/v1/auth/oauth/google/callback
```

```ini
BALNANA_OAUTH_GOOGLE_CLIENT_ID=
BALNANA_OAUTH_GOOGLE_SECRET=
```

People can also add Google to an existing account in Settings.

## OpenID Connect providers

Any provider that serves `/.well-known/openid-configuration` works, such as Authentik, Keycloak or Dex. List provider IDs (lowercase letters, digits and dashes, not `google`) and give each its own settings, named after the ID in capitals with dashes as underscores:

```ini
BALNANA_OAUTH_OIDC_PROVIDERS=authentik
BALNANA_OAUTH_OIDC_AUTHENTIK_ISSUER=https://auth.example.com/application/o/balnana/
BALNANA_OAUTH_OIDC_AUTHENTIK_CLIENT_ID=
BALNANA_OAUTH_OIDC_AUTHENTIK_SECRET=
BALNANA_OAUTH_OIDC_AUTHENTIK_NAME=Authentik
```

Each provider's redirect URI is `<BALNANA_PUBLIC_URL>/api/v1/auth/oauth/<id>/callback`.

## Verified email and existing accounts

A provider sign-in joins an existing account only when both sides have confirmed the same email.

- `BALNANA_OAUTH_GOOGLE_TRUST_EMAIL` (default `true`) trusts Google's verified email.
- `BALNANA_OAUTH_OIDC_<ID>_TRUST_EMAIL` (default `false`) does the same for a provider. Only turn it on for a provider you run or trust to check that emails belong to people.

When someone signs in with a trusted provider whose email matches an account that never confirmed that email:

- with `BALNANA_AUTH_REQUIRE_VERIFIED=true`, the provider's person takes that account over and its password is removed, so whoever typed someone else's address at sign-up cannot keep its owner out;
- otherwise they choose: add the provider to that account (with its password), take the account over, or start a new one.
