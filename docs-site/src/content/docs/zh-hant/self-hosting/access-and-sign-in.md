---
title: 存取與登入
description: 連結模式、帳號模式、註冊規則，以及用 Google 或任何 OpenID Connect 提供者登入。
---

Balnana 有兩種存取模式，可用 `BALNANA_AUTH_MODE` 或在 `/admin` 設定。

## 連結模式（預設）

只要有群組的私人連結或它的 QR code 就能使用。不需要任何人註冊。

連結模式的群組存放在每台裝置的連結清單中。**設定 → 我的群組連結**可以一次複製全部連結，並在另一台裝置上匯入。

## 帳號模式

設定 `BALNANA_AUTH_MODE=accounts` 後，使用者需要登入，群組連結只讓已登入的人加入群組：認領其中一位成員，或新增自己。除非設定 `BALNANA_LINK_GROUPS=false`，群組擁有者仍可讓任何持有連結的人進入群組。

| 設定 | 預設 | 作用 |
| --- | --- | --- |
| `BALNANA_AUTH_PASSWORD` | `true` | 允許用電子郵件與密碼登入。 |
| `BALNANA_AUTH_REQUIRE_EMAIL` | `true` | 設為 `false` 時，改用使用者名稱註冊，並可用任一種登入。 |
| `BALNANA_AUTH_SIGNUP` | `open` | 誰可以註冊：`open`、`invite_only` 或 `closed`。 |
| `BALNANA_LINK_GROUPS` | `true` | 群組擁有者能否只憑連結就讓人加入。 |
| `BALNANA_AUTH_REQUIRE_VERIFIED` | `false` | 帳號確認電子郵件前，只能進入自己的設定。需要[電子郵件](/docs/zh-hant/self-hosting/configuration/#電子郵件)。 |

伺服器上第一個註冊的帳號一定能註冊，即使設定了 `BALNANA_AUTH_SIGNUP=closed`，所以關閉註冊的伺服器仍然可以完成初始設定。

## 用 Google 登入

向 Google 註冊這個重新導向 URI，再設定用戶端 ID 與密鑰：

```text
<BALNANA_PUBLIC_URL>/api/v1/auth/oauth/google/callback
```

```ini
BALNANA_OAUTH_GOOGLE_CLIENT_ID=
BALNANA_OAUTH_GOOGLE_SECRET=
```

使用者也可以在設定中把 Google 加到現有帳號。

## OpenID Connect 提供者

任何提供 `/.well-known/openid-configuration` 的提供者都能使用，例如 Authentik、Keycloak 或 Dex。列出提供者 ID（小寫字母、數字與連字號，不能是 `google`），並為每個提供者設定各自的變數，名稱為該 ID 的大寫、連字號改為底線：

```ini
BALNANA_OAUTH_OIDC_PROVIDERS=authentik
BALNANA_OAUTH_OIDC_AUTHENTIK_ISSUER=https://auth.example.com/application/o/balnana/
BALNANA_OAUTH_OIDC_AUTHENTIK_CLIENT_ID=
BALNANA_OAUTH_OIDC_AUTHENTIK_SECRET=
BALNANA_OAUTH_OIDC_AUTHENTIK_NAME=Authentik
```

每個提供者的重新導向 URI 為 `<BALNANA_PUBLIC_URL>/api/v1/auth/oauth/<id>/callback`。

## 已驗證的電子郵件與現有帳號

只有在雙方都確認過同一個電子郵件時，透過提供者登入才會連到現有帳號。

- `BALNANA_OAUTH_GOOGLE_TRUST_EMAIL`（預設 `true`）信任 Google 已驗證的電子郵件。
- `BALNANA_OAUTH_OIDC_<ID>_TRUST_EMAIL`（預設 `false`）對該提供者做同樣的事。只對你自己執行、或你信任會確認電子郵件屬於本人的提供者開啟。

當有人透過受信任的提供者登入，而其電子郵件與某個從未確認該信箱的帳號相符時：

- 若設定 `BALNANA_AUTH_REQUIRE_VERIFIED=true`，提供者那邊的人會接管該帳號，帳號密碼也會被移除，因此註冊時填了別人信箱的人無法把信箱主人擋在外面；
- 否則由他選擇：把提供者加到該帳號（需輸入該帳號密碼）、接管該帳號，或建立新帳號。
