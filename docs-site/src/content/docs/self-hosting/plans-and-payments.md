---
title: Plans and payments
description: Limit what each plan allows, and take payments through Ko-fi, PayPal or Google Play.
---

Plans are off unless you turn them on, and a server with them off limits nothing. They need [accounts mode](/docs/self-hosting/access-and-sign-in/). Turn them on in `/admin` under **Plans and payments** with **Plans and limits**, then use **Plans** to set what each plan allows:

- **Receipt photos per group** and **recurring expenses per group**;
- **groups an account is in**, whoever made them, and **people per group**;
- **groups sharing the plan**: how many groups an account can lift to its own plan;
- **payment reminders**: whether people in a group can remind someone who owes them with a notification. Sharing a reminder as a message through another app is always free, and with plans off everyone can send them.

Leave a limit empty for none. Exactly one plan is the default, for every account with no other. An account with several plans gets the one with the highest rank.

Bookkeeping stays free: expenses, splits, settling up, statistics, CSV export, push and live updates are never limited. A new limit only stops what is added next, and nothing is deleted when a plan ends.

## Plan sharing

A group's limits come from the member who shares their plan with it, for as long as they stay a member and the plan lasts. Otherwise they come from the default plan. One member's plan covers a group at a time, and a plan covers as many groups as its **groups sharing the plan** limit allows.

Someone signed in shares their plan with the same switch in three places:

- **Settings → Plan sharing** lists their groups with a switch each, and says how many groups share the plan;
- a group's settings have **Share my plan with this group**;
- the **New group** form has it too, so a group can use its maker's plan from the start.

The switch can't be turned on for a group another member's plan already covers, or once the plan is shared with as many groups as it allows. Turning it off puts the group back on the default plan; nothing in it is deleted.

A [Settle Up import](/docs/guides/import-settle-up/) with more people than the default plan allows shares its importer's plan from the start.

## Ko-fi

1. Set **Ko-fi page** to your `https://ko-fi.com/...` address.
2. In Ko-fi's webhook settings, enter `<public URL>/api/v1/webhooks/kofi` as the URL. `/admin` shows the exact address. The public URL must be `https://`.
3. Copy Ko-fi's verification token into **Ko-fi verification token**. Until it is set, the webhook answers 404.
4. In your Ko-fi shop, add an item for each length you sell, such as 90 days and 360 days.
5. Under **Plans**, add a product with **Paid through** set to Ko-fi for each item. Its **Shop item code** is the end of the item's link, `ko-fi.com/s/<code>`, and **Days** is how long the item lasts. Buying several of an item adds its days for each.
6. To take tips as well, add a product with no shop item code. It matches a tip of at least its amount, in its currency; with several, the highest amount a tip reaches wins.

To pay, someone buys one of the shop items on your Ko-fi page, or sends a tip. Then, on the app's **Plan** page, they open **Add a Ko-fi payment** and enter the transaction ID from Ko-fi's receipt, or the link with it in. Each payment adds its days to what is left.

**Payments** lists everything Ko-fi sent. *Unclaimed* means nobody has added it yet and *unmatched* means no product fits; **Give to an account** settles either by hand. Ko-fi does not report refunds: after refunding someone, revoke the plan under **Accounts**.

## PayPal

1. At [developer.paypal.com](https://developer.paypal.com), create a REST app for your PayPal Business account. Under **Plans and payments**, paste its client ID into **PayPal client ID** and its secret into **PayPal secret**.
2. Add a webhook to the app with `<public URL>/api/v1/webhooks/paypal` as its URL (`/admin` shows the exact address) and these events: `CHECKOUT.ORDER.APPROVED`, `PAYMENT.CAPTURE.COMPLETED`, `PAYMENT.CAPTURE.REFUNDED`, `PAYMENT.CAPTURE.REVERSED`, `PAYMENT.CAPTURE.DENIED`, `PAYMENT.SALE.COMPLETED` and every `BILLING.SUBSCRIPTION.*` event. The public URL must be `https://`.
3. Copy the webhook's ID into **PayPal webhook ID**. PayPal stays off until the client ID, secret and webhook ID are all set.
4. Under **Plans**, add a product with **Paid through** set to PayPal for each thing you sell. Its **Plan ID or name** decides what it is:
   - A PayPal subscription plan's ID, starting with `P-`, makes it a subscription. PayPal sets its price, and the plan lasts as long as the subscription is paid for.
     - If the PayPal plan has a free trial, set **Plan ID without the trial** to the ID of the same plan with no trial. PayPal gives the trial to every new subscription, so accounts that have already had a trial subscribe to that plan instead. Each account gets access during a trial once.
   - Any other name makes it a one-off payment of the product's amount and currency, which adds its days to what is left.

To try it out first, turn on **PayPal sandbox** and use a sandbox app's credentials: nothing is really paid.

On the app's **Plan** page, someone taps one of the offers, pays on PayPal, and comes back to the app, which says whether the payment went through. The server asks PayPal about every payment and believes nothing else. Subscribers change or cancel their subscription at paypal.com, which **Manage PayPal subscription** opens.

PayPal reports refunds and reversals: the payment shows as *refunded* in **Payments**, and the time it gave is taken back. A free trial pays nothing, but **Payments** lists it too, once for each subscription that had one: a *Trial* entry with no amount.

Only the web app, and Android builds made to allow outside payments (see [Android release builds](/docs/apps/android/#two-builds)), show Ko-fi and PayPal. The others show the plan and its limits only.

## Google Play

Only the app's `play` build sells these (see [Android release builds](/docs/apps/android/#two-builds)), and only for the package you publish it under.

1. In Play Console, create the subscriptions and activate a base plan for each.
2. In Google Cloud, create a service account and a JSON key for it. In Play Console, invite it under **Users and permissions** with permission to view financial data and to manage orders and subscriptions.
3. Under **Plans and payments**, set **Google Play package name** and paste the key into **Google Play service account**. Together they turn Google Play on.
4. Add a product under **Plans** with **Paid through** set to Google Play, the **Product ID** from Play Console, and the plan it buys. Google Play says when each payment ends, so a product has no days of its own.
5. For renewals and cancellations to arrive by themselves, create a Pub/Sub topic and give `google-play-developer-notifications@system.gserviceaccount.com` the Pub/Sub Publisher role on it, then enter the topic under **Monetization setup** in Play Console. Add a push subscription to `<public URL>/api/v1/webhooks/play` with authentication on, that same URL as its audience, and a service account of your own; enter that account's email as **Pub/Sub push account**. Without this, a renewal only arrives when its owner opens the plan page.

The server asks Google about every purchase and believes nothing else, so refunds and revocations made in Play Console reach it the same way. Revoking a plan under **Accounts** holds when Google reports on the purchase again, but it doesn't stop the subscription: cancel that in Play Console too.

## Payment records

Each payment keeps the payer's email and name. Set `BALNANA_PAYMENT_KEEP_DAYS` to erase them after that many days; the amount, date and plan stay, even if the account is deleted. An unclaimed payment can then only be claimed by its transaction ID. Choose the number with what your country requires of sales records, and say so in your privacy policy. Left out or 0, they are kept for good.

## Settings

All of these but the last are **admin** settings: they can also be set in `.env`, which wins over `/admin` (see [Configuration](/docs/self-hosting/configuration/)).

| Setting | In `/admin` | |
| --- | --- | --- |
| `BALNANA_BILLING_ENABLED` | Plans and limits | `true` turns plans on. Needs `BALNANA_AUTH_MODE=accounts`. |
| `BALNANA_KOFI_URL` | Ko-fi page | An `https://` address. Set it and the token together. |
| `BALNANA_KOFI_TOKEN` | Ko-fi verification token | |
| `BALNANA_PAYPAL_CLIENT_ID` | PayPal client ID | From a REST app at developer.paypal.com. Set it with the secret and webhook ID. |
| `BALNANA_PAYPAL_SECRET` | PayPal secret | |
| `BALNANA_PAYPAL_WEBHOOK_ID` | PayPal webhook ID | |
| `BALNANA_PAYPAL_SANDBOX` | PayPal sandbox | `true` uses PayPal's sandbox, with a sandbox app's credentials. |
| `BALNANA_PLAY_PACKAGE` | Google Play package name | |
| `BALNANA_PLAY_SERVICE_ACCOUNT` | Google Play service account | The service account's JSON key. |
| `BALNANA_PLAY_PUSH_ACCOUNT` | Pub/Sub push account | |
| `BALNANA_PAYMENT_KEEP_DAYS` | — | `.env` only. See [Payment records](#payment-records). |
