---
title: 访问与登录
description: 链接模式、账号模式、注册规则、两步登录，以及用 Google 或任何 OpenID Connect 提供方登录。
---

Balnana 有两种访问模式，可用 `BALNANA_AUTH_MODE` 或在 `/admin` 设置。

## 链接模式（默认）

只要有群组的私人链接或它的二维码就能使用。不需要任何人注册。

链接模式的群组保存在每台设备的链接列表中。**设置 → 我的群组链接**可以一次复制全部链接，并在另一台设备上导入。

## 账号模式

设置 `BALNANA_AUTH_MODE=accounts` 后，用户需要登录，群组链接只让已登录的人加入群组：认领其中一位成员，或添加自己。除非设置 `BALNANA_LINK_GROUPS=false`，群组所有者仍可让任何持有链接的人进入群组。

| 设置 | 默认 | 作用 |
| --- | --- | --- |
| `BALNANA_AUTH_PASSWORD` | `true` | 允许用电子邮件与密码登录。 |
| `BALNANA_AUTH_REQUIRE_EMAIL` | `true` | 设为 `false` 时，改用用户名注册，并可用任一种登录。 |
| `BALNANA_AUTH_SIGNUP` | `open` | 谁可以注册：`open`、`invite_only` 或 `closed`。 |
| `BALNANA_LINK_GROUPS` | `true` | 群组所有者能否仅凭链接就让人加入。 |
| `BALNANA_AUTH_REQUIRE_VERIFIED` | `false` | 账号确认电子邮件前，只能进入自己的设置。需要[电子邮件](/docs/zh-hans/self-hosting/configuration/#电子邮件)。 |

服务器上第一个注册的账号一定能注册，即使设置了 `BALNANA_AUTH_SIGNUP=closed`，所以关闭注册的服务器仍然可以完成初始设置。

## 两步登录

有密码的账号可以在每次用密码登录时，另外要求一个验证码。每个人在**设置 → 两步登录**为自己的账号开启，步骤请见[两步登录指南](/docs/zh-hans/guides/two-step-sign-in/)。服务器不需要为它做任何设置，也没有强制所有人使用的设置。

- **身份验证器应用**：任何身份验证器（TOTP）应用生成的六位验证码。开启后会得到八个恢复码，每个可以代替应用的验证码登录一次。
- **邮箱验证码**：发到账号邮箱的六位验证码，10 分钟内有效。服务器必须能发送[电子邮件](/docs/zh-hans/self-hosting/configuration/#电子邮件)，账号也必须确认过邮箱。

两者都开启时，任一种验证码都能登录。

只有用密码登录时才会要求验证码。用 Google 或 OpenID Connect 提供方登录时不会要求：这类登录的安全性由该提供方自己的第二步负责。

如果账号已经收不到邮件，例如服务器不再发送电子邮件，或账号不再有已确认的邮箱，登录时就不会要求邮箱验证码，以免被挡在外面。

:::caution
`/admin` 目前还不能替别人关闭两步登录。丢失身份验证器应用的人，要用恢复码登录；如果也开启了邮箱验证码，也可以用发到邮箱的验证码。请提醒大家保存好恢复码。
:::

## 用 Google 登录

向 Google 登记这个重定向 URI，再设置客户端 ID 与密钥：

```text
<BALNANA_PUBLIC_URL>/api/v1/auth/oauth/google/callback
```

```ini
BALNANA_OAUTH_GOOGLE_CLIENT_ID=
BALNANA_OAUTH_GOOGLE_SECRET=
```

用户也可以在设置中把 Google 添加到现有账号。

## OpenID Connect 提供方

任何提供 `/.well-known/openid-configuration` 的提供方都能使用，例如 Authentik、Keycloak 或 Dex。列出提供方 ID（小写字母、数字与连字符，不能是 `google`），并为每个提供方设置各自的变量，名称为该 ID 的大写、连字符改为下划线：

```ini
BALNANA_OAUTH_OIDC_PROVIDERS=authentik
BALNANA_OAUTH_OIDC_AUTHENTIK_ISSUER=https://auth.example.com/application/o/balnana/
BALNANA_OAUTH_OIDC_AUTHENTIK_CLIENT_ID=
BALNANA_OAUTH_OIDC_AUTHENTIK_SECRET=
BALNANA_OAUTH_OIDC_AUTHENTIK_NAME=Authentik
```

每个提供方的重定向 URI 为 `<BALNANA_PUBLIC_URL>/api/v1/auth/oauth/<id>/callback`。

## 已验证的电子邮件与现有账号

只有在双方都确认过同一个电子邮件时，通过提供方登录才会关联到现有账号。

- `BALNANA_OAUTH_GOOGLE_TRUST_EMAIL`（默认 `true`）信任 Google 已验证的电子邮件。
- `BALNANA_OAUTH_OIDC_<ID>_TRUST_EMAIL`（默认 `false`）对该提供方做同样的事。只对你自己运行、或你信任会确认电子邮件属于本人的提供方开启。

当有人通过受信任的提供方登录，而其电子邮件与某个从未确认该邮箱的账号相符时：

- 若设置 `BALNANA_AUTH_REQUIRE_VERIFIED=true`，提供方那边的人会接管该账号，账号密码也会被移除，因此注册时填了别人邮箱的人无法把邮箱主人挡在外面；
- 否则由他选择：把提供方添加到该账号（需输入该账号密码）、接管该账号，或创建新账号。
