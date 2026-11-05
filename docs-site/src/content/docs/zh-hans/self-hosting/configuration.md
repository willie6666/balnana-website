---
title: 设置
description: 电子邮件、地图、汇率、推送通知、隐私声明与其他服务器设置。
---

所有设置都放在 `.env`（由 `docker-compose.yml` 读取）。标有 **admin** 的设置也能在 `/admin` 修改；在 `.env` 设置的变量优先于 `/admin`。

## 服务器

| 设置 | 默认 | |
| --- | --- | --- |
| `BALNANA_PUBLIC_URL` | `http://localhost:8080` | **admin** · 用户访问的网址。群组链接以它为基础。 |
| `BALNANA_PORT` | `8080` | 要开放的主机端口（仅限 Compose）。 |
| `BALNANA_BIND` | `0.0.0.0` | 要开放的主机地址。在本机代理后面时请用 `127.0.0.1`。 |
| `BALNANA_LOG_LEVEL` | `info` | `debug`、`info`、`warn` 或 `error`。 |
| `BALNANA_SOURCE_URL` | Balnana 仓库 | **admin** · 显示在设置 → 关于 → 源代码。若运行修改过的版本，请指向你的源代码。 |
| `BALNANA_PRIVACY_URL` | — | **admin** · 你自己的隐私政策，链接会出现在登录页面与设置 → 关于。未设置时 App 会显示一份简短的内置声明。 |
| `BALNANA_CORS_ORIGINS` | — | 允许调用 API 的其他网页来源。请参阅[连接 App](/docs/zh-hans/apps/connecting/#在其他来源提供网页版-app)。 |

## 电子邮件

电子邮件用来发送验证、重置密码与邀请邮件。`BALNANA_SMTP_HOST` 为空时不会启用。以下都是 **admin** 设置。

```ini
BALNANA_SMTP_HOST=smtp.example.com
BALNANA_SMTP_PORT=587
BALNANA_SMTP_USER=
BALNANA_SMTP_PASSWORD=
BALNANA_SMTP_FROM=Balnana <balnana@example.com>
```

465 端口从一开始就使用 TLS；其他端口在邮件服务器支持时会以 STARTTLS 升级。电子邮件中带有登录链接，因此不提供 TLS 的邮件服务器会被拒绝，除非它在同一台机器上。`BALNANA_SMTP_ALLOW_PLAINTEXT=true`（仅限 `.env`）仍会发送到你自己网络上的邮件服务器，但不加密。

## 地图

支出可以附上地点，并显示在地图上。`BALNANA_MAP_SOURCE`（**admin**）决定地图来源：

- `style`（默认）：来自 MapLibre 样式 `BALNANA_MAP_STYLE` 的矢量地图。默认是 OpenFreeMap 的 Liberty 样式，免费且不需密钥。
- `tiles`：来自 `BALNANA_MAP_TILES` 的栅格瓦片，为包含 `{z}`、`{x}` 与 `{y}` 的网址模板。默认是 OpenStreetMap 自己的瓦片服务器，按其[瓦片使用政策](https://operations.osmfoundation.org/policies/tiles/)适合少量使用；流量大的服务器请使用其他提供商或自己的瓦片服务器。
- `off`：不显示地图。地点仍会保留。

`BALNANA_MAP_ATTRIBUTION` 设置每张地图上显示的来源署名，按提供商要求填写。

## 汇率

支出以其他货币支付时，App 会以服务器查到的最新汇率作为初始值。用户自行输入的数字仍然优先；服务器查不到汇率时，App 会沿用群组上次使用的汇率。

- `BALNANA_EXCHANGE_RATES`（**admin**，默认 `true`）：设为 `false` 就不查询汇率，每个汇率都要手动输入。
- `BALNANA_OXR_APP_ID`（**admin**，机密）：[Open Exchange Rates](https://openexchangerates.org/) 的 App ID。没有设置时，汇率来自 [Frankfurter](https://frankfurter.dev/)，也就是欧洲中央银行的免费参考汇率，不需密钥，但只涵盖约 30 种货币，且每个工作日更新一次。设置后改由 Open Exchange Rates 提供，涵盖约 170 种货币。

服务器最多每小时向来源查询一次，而且只在有人选了货币时才查询，所以 Open Exchange Rates 的免费方案（每月 1,000 次）就足够。最后一次获取的汇率会存在数据库里，重启后不会再查询一次，来源连不上时也会继续使用。

申请 App ID：到 [openexchangerates.org/signup/free](https://openexchangerates.org/signup/free) 注册免费方案，从控制台复制 App ID，粘贴到 `/admin` 或写进 `.env`。

## 推送通知

当有人添加、修改或删除与某人有关的支出或转账，或提醒对方付款时，服务器会通知对方的手机和浏览器。不需要任何设置：服务器第一次启动时会自行生成 VAPID 密钥并存在数据库中。`BALNANA_PUSH=false` 可关闭通知。

通知是标准的 Web Push 消息，端到端加密，通过 [UnifiedPush](https://unifiedpush.org/) 发送。装有 UnifiedPush 分发器（例如 [ntfy](https://ntfy.sh/)）的手机会通过它接收。否则 App 会使用内置的分发器，在有 Google Play 服务的手机上经由 Google 的 Firebase Cloud Messaging 发送；App 不含 Firebase SDK，也不需要 Firebase 项目。用户可以在每台设备的设置 → 通知中开关通知。

网页版通过浏览器本身的推送服务接收通知，没有打开标签页时也收得到。服务器必须使用 `https`（或 `localhost`）；网页版默认关闭，要在设置 → 通知中开启，因为浏览器只会在那时请求权限。屏蔽过通知的人，要到浏览器的网站设置中重新允许。在 iPhone 和 iPad 上，Safari 只有把网页版添加到主屏幕后才收得到。

服务器只会发送到公开的 `https` 地址。位于你自己网络中的分发器，例如自建在 `http://192.168.1.2` 的 ntfy，需要设置 `BALNANA_PUSH_PRIVATE_ENDPOINTS=true`。

## 不使用 Compose 运行

若要直接运行二进制文件，`.env.example` 也列出了 `BALNANA_LISTEN`、`BALNANA_DATABASE_URL`（或 `DATABASE_URL`）、`BALNANA_DATABASE_PASSWORD`，以及 `BALNANA_WEB_DIR`，用来从磁盘提供 Flutter 网页版构建，替代内嵌的版本。
