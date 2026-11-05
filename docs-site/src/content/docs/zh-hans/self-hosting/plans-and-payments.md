---
title: 方案与付款
description: 设置每个方案的限制，并通过 Ko-fi、PayPal 或 Google Play 收款。
---

方案默认关闭，关闭时服务器不做任何限制。方案需要[账号模式](/docs/zh-hans/self-hosting/access-and-sign-in/)。在 `/admin` 的**方案与付款**下开启**方案与限制**，再到**方案**设置每个方案允许的内容：

- **每个群组的收据照片**与**每个群组的周期性支出**；
- 一个账号**加入的群组**（不论是谁创建的），以及**每个群组的人数**；
- **共享方案的群组**：一个账号能让多少个群组使用自己的方案；
- **付款提醒**：群组里的人能不能用通知提醒欠款的人。通过其他 App 分享提醒消息永远免费；方案关闭时，每个人都能发送通知提醒。

限制留空表示不限。恰好一个方案是默认方案，应用在没有其他方案的每个账号上。账号有多个方案时，使用优先级最高的那个。

记账本身永远免费：支出、分账、结清、统计、CSV 导出、推送与实时更新都不受限制。新的限制只会挡下之后添加的内容，方案结束时也不会删除任何东西。

群组的限制来自把方案共享给它的成员，只要对方仍是成员、方案仍有效。否则就使用默认方案。[Settle Up 导入](/docs/zh-hans/guides/import-settle-up/)的人数若超过默认方案允许的上限，从一开始就会应用导入者的方案。

## Ko-fi

1. 把 **Ko-fi 页面**设为你的 `https://ko-fi.com/...` 网址。
2. 在 Ko-fi 的 webhook 设置中，把网址填为 `<公开网址>/api/v1/webhooks/kofi`。`/admin` 会显示确切的网址。公开网址必须是 `https://`。
3. 把 Ko-fi 的验证令牌复制到 **Ko-fi 验证令牌**。设置之前，webhook 一律返回 404。
4. 在你的 Ko-fi 商店中，为每种销售的期限添加一个商品，例如 90 天与 360 天。
5. 在**方案**下，为每个商店商品添加一个**付款方式**为 Ko-fi 的商品。它的**商店商品代码**是商品链接的最后一段 `ko-fi.com/s/<代码>`，**天数**则是这个商品的有效天数。一次买多个同样的商品时，每个都会加上它的天数。
6. 若也要接受打赏，请添加一个没有商店商品代码的商品。它对应金额至少达到它、币种相同的打赏；有多个时，以打赏金额能达到的最高门槛为准。

付款时，付款人在你的 Ko-fi 页面购买其中一个商店商品，或送出打赏。然后在 App 的**方案**页面打开**添加 Ko-fi 款项**，输入 Ko-fi 收据上的交易 ID，或包含它的链接。每笔付款会把它的天数加到剩余天数上。

**付款记录**列出 Ko-fi 发来的所有付款。*待认领*表示还没有人添加它，*未匹配*表示没有符合的商品；两者都可以用**提供给账号**手动处理。Ko-fi 不会报告退款：给某人退款后，请到**账号**撤销他的方案。

## PayPal

1. 在 [developer.paypal.com](https://developer.paypal.com) 为你的 PayPal 商家账户创建一个 REST 应用。在**方案与付款**下，把它的客户端 ID 粘贴到 **PayPal 客户端 ID**，密钥粘贴到 **PayPal 密钥**。
2. 在该应用添加一个 webhook，网址填 `<公开网址>/api/v1/webhooks/paypal`（`/admin` 会显示确切的网址），并勾选这些事件：`CHECKOUT.ORDER.APPROVED`、`PAYMENT.CAPTURE.COMPLETED`、`PAYMENT.CAPTURE.REFUNDED`、`PAYMENT.CAPTURE.REVERSED`、`PAYMENT.CAPTURE.DENIED`、`PAYMENT.SALE.COMPLETED`，以及所有 `BILLING.SUBSCRIPTION.*` 事件。公开网址必须是 `https://`。
3. 把 webhook 的 ID 复制到 **PayPal Webhook ID**。客户端 ID、密钥与 webhook ID 都设置之前，PayPal 不会开启。
4. 在**方案**下，为每样销售的东西添加一个**付款方式**为 PayPal 的商品。它的**方案 ID 或名称**决定它是什么：
   - PayPal 订阅方案的 ID（以 `P-` 开头）会让它成为订阅。价格由 PayPal 设置，只要订阅持续付款，方案就一直有效。
     - 若 PayPal 方案有免费试用，请把**无试用期的方案 ID** 设为同一个方案但没有试用期的 ID。PayPal 会让每笔新订阅都有试用，所以试用过的账号会改订那个方案。每个账号只有一次试用期间能获得权限。
   - 其他任何名称都会让它成为一次性付款，金额与币种按商品设置，付款后把它的天数加到剩余天数上。

若想先试用，请开启 **PayPal 沙盒**并使用沙盒应用的凭据：不会真的付款。

付款人在 App 的**方案**页面点选其中一个方案，在 PayPal 付款后回到 App，App 会告知付款是否成功。服务器会向 PayPal 核实每笔付款，不采信其他来源。订阅者可以在 paypal.com 更改或取消订阅，**管理 PayPal 订阅**会打开那里。

PayPal 会报告退款与撤回：该笔付款在**付款记录**中会显示为*已退款*，它给的时间也会收回。

只有网页版，以及设置为允许外部付款的 Android 构建（见 [Android 正式版构建](/docs/zh-hans/apps/android/#两种构建)），会显示 Ko-fi 与 PayPal。其他版本只显示方案与它的限制。

## Google Play

只有 App 的 `play` 构建会销售 Google Play 订阅（见 [Android 正式版构建](/docs/zh-hans/apps/android/#两种构建)），而且只限你上架时使用的软件包名称。

1. 在 Play 管理中心创建订阅，并为每个订阅启用一个基础方案。
2. 在 Google Cloud 创建一个服务账号及它的 JSON 密钥。在 Play 管理中心的**用户和权限**下邀请它，并授予查看财务数据、管理订单和订阅的权限。
3. 在**方案与付款**下设置 **Google Play 软件包名称**，并把密钥粘贴到 **Google Play 服务账号**。两者都设置后，Google Play 就会开启。
4. 在**方案**下添加商品，**付款方式**选 Google Play，填入 Play 管理中心中的**产品 ID**，以及它购买的方案。Google Play 会告知每笔付款何时结束，因此商品没有自己的天数。
5. 若要让续订与取消自动送达，请创建一个 Pub/Sub 主题，授予 `google-play-developer-notifications@system.gserviceaccount.com` 该主题的 Pub/Sub 发布者角色，再到 Play 管理中心的**创收设置**填入这个主题。接着添加一个推送到 `<公开网址>/api/v1/webhooks/play` 的推送订阅，开启身份验证，以同一个网址作为受众，并使用你自己的服务账号；把那个账号的电子邮件填为 **Pub/Sub 推送账号**。没有这些设置时，续订只会在所有者打开方案页面时才送达。

服务器会向 Google 核实每笔购买，不采信其他来源，因此在 Play 管理中心做的退款与撤销也会同样送达。在**账号**撤销方案后，即使 Google 再次报告该笔购买，撤销仍然有效，但这不会停止订阅：请同时在 Play 管理中心取消。

## 付款记录

每笔付款都会保存付款人的电子邮件与名称。设置 `BALNANA_PAYMENT_KEEP_DAYS` 后，它们会在那么多天后清除；金额、日期与方案则会保留，即使账号已删除。之后未认领的付款只能用交易 ID 认领。请按你所在国家对销售记录的要求决定天数，并写在你的隐私政策中。未设置或设为 0 时，会永久保存。

## 设置

除了最后一项，以下都是 **admin** 设置：也可以写在 `.env` 中，且 `.env` 的值优先于 `/admin`（见[设置](/docs/zh-hans/self-hosting/configuration/)）。

| 设置 | 在 `/admin` 中 | |
| --- | --- | --- |
| `BALNANA_BILLING_ENABLED` | 方案与限制 | 设为 `true` 开启方案。需要 `BALNANA_AUTH_MODE=accounts`。 |
| `BALNANA_KOFI_URL` | Ko-fi 页面 | `https://` 网址。需与令牌一起设置。 |
| `BALNANA_KOFI_TOKEN` | Ko-fi 验证令牌 | |
| `BALNANA_PAYPAL_CLIENT_ID` | PayPal 客户端 ID | 来自 developer.paypal.com 的 REST 应用。需与密钥、webhook ID 一起设置。 |
| `BALNANA_PAYPAL_SECRET` | PayPal 密钥 | |
| `BALNANA_PAYPAL_WEBHOOK_ID` | PayPal Webhook ID | |
| `BALNANA_PAYPAL_SANDBOX` | PayPal 沙盒 | 设为 `true` 时使用 PayPal 沙盒，并搭配沙盒应用的凭据。 |
| `BALNANA_PLAY_PACKAGE` | Google Play 软件包名称 | |
| `BALNANA_PLAY_SERVICE_ACCOUNT` | Google Play 服务账号 | 服务账号的 JSON 密钥。 |
| `BALNANA_PLAY_PUSH_ACCOUNT` | Pub/Sub 推送账号 | |
| `BALNANA_PAYMENT_KEEP_DAYS` | — | 只能写在 `.env`。见[付款记录](#付款记录)。 |
