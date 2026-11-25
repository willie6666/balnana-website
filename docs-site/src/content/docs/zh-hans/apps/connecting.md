---
title: 连接 App
description: 让网页版、Android 与 iOS App 连到你的服务器，并在构建时指定默认服务器。
---

## 网页版

网页版 App 会连到提供它的那台服务器，不需要任何设置。

## Android

第一次启动时，App 会询问服务器网址。之后可以在**设置 → 服务器**中更改（网页版没有这个设置）。

构建时也可以内置默认服务器，用户就不必自己输入网址：

```bash
flutter build apk --dart-define=BALNANA_SERVER_URL=https://balnana.example.com
```

### App 链接

这样的构建也会在 App 中打开该服务器的群组、邀请、仅供查看与电子邮件链接。若要让 Android 不经询问直接打开，请在 `/admin` → Android 应用链接中输入该构建签名证书的 SHA-256 指纹，或设置 `BALNANA_ANDROID_CERT_SHA256`（多个以逗号分隔）。以下命令会打印指纹：

```bash
keytool -list -v -keystore <你的 keystore>
```

接着服务器就会提供 `/.well-known/assetlinks.json`。若使用 Play 应用签名，也请加上 Play 应用签名证书的指纹。

## iOS

首次打开时，请输入 `https://app.balnana.com` 或自行部署的服务器地址。之后可在**设置 → 服务器**中更改。如果 iOS 询问是否允许访问本地网络，请允许，以便 App 连接同一局域网内的服务器。

安装与默认服务器的设置方法见[构建 iOS 版 Balnana](/docs/zh-hans/apps/ios/)。Google 与 OpenID Connect 登录会在 App 内的浏览器窗口中进行，完成后返回 App；[通过 Apple 登录](/docs/zh-hans/self-hosting/access-and-sign-in/#通过-apple-登录)则使用 iPhone 本身的登录界面。HTTPS 链接的打开方式见[通用链接](#通用链接)。

### 通用链接

iOS App 会在 App 中打开 `app.balnana.com` 上的群组、邀请、仅供查看与电子邮件链接。其他服务器的链接会在浏览器中打开，除非那台服务器有自己的构建（见下方）。只有链接属于 App 当前连接的服务器时才会在 App 中打开；否则 App 会提示这是另一台服务器的链接。

若要让你自己的构建打开你服务器的链接：

1. 在 `ios/Runner/Runner.entitlements` 中把 `app.balnana.com` 换成你服务器的主机（`applinks:balnana.example.com`），并在 Apple 开发者账号中为该 App ID 开启 Associated Domains 功能。
2. 在 `/admin` → iOS 应用中输入签署 App 的 Apple 开发者账号团队 ID，或设置 `BALNANA_APPLE_TEAM_ID`。它由 10 个大写英文字母与数字组成，可在 Membership details 中找到。

接着服务器就会为同一区块设置的 Bundle ID（留空则为 `com.balnana.app`）提供 `/.well-known/apple-app-site-association`。iOS 会在安装 App 时读取它，因此更改后请重新安装 App。

## 在其他来源提供网页版 App

若要从服务器以外的地方提供网页版 App，请用服务器网址构建：

```bash
flutter build web --dart-define=BALNANA_SERVER_URL=https://balnana.example.com
```

然后把它的来源（协议、主机与端口，例如 `https://app.example.com`）列在 `BALNANA_CORS_ORIGINS` 中。

浏览器不会把服务器的会话 Cookie 交给其他网站，所以这样的 App 改为把 bearer token 存在浏览器的本地存储中，就像 Android App 把它存在手机上一样。密码登录与在服务器自己的网页版上相同。Google 与 OpenID Connect 登录会带着一次性代码回到 App 的 `/oauth-done` 页面，这只对明确列出名称的来源有效：`*` 允许任何网站调用 API，但不会把登录送回任何一个。电子邮件中的链接仍会打开服务器自己的网页版。
