---
title: Plans and payments
description: Limit what each plan allows, and take payments through Ko-fi or Google Play.
---

Plans are off unless you turn them on, and a server with them off limits nothing. They need [accounts mode](/docs/self-hosting/access-and-sign-in/). Turn them on in `/admin` under **Plans and payments** with **Plans and limits**, then use **Plans** to set what each plan allows:

- **Receipt photos per group** and **recurring expenses per group**;
- **groups an account is in**, whoever made them, and **people per group**;
- **groups sharing the plan**: how many groups an account can lift to its own plan;
- **payment reminders**: whether people in a group can remind someone who owes them with a notification. Sharing a reminder as a message through another app is always free, and with plans off everyone can send them.

Leave a limit empty for none. Exactly one plan is the default, for every account with no other. An account with several plans gets the one with the highest rank.

Bookkeeping stays free: expenses, splits, settling up, statistics, CSV export, push and live updates are never limited. A new limit only stops what is added next, and nothing is deleted when a plan ends.

A group's limits come from the member who shares their plan with it, for as long as they stay a member and the plan lasts. Otherwise they come from the default plan. A [Settle Up import](/docs/guides/import-settle-up/) with more people than the default plan allows shares its importer's plan from the start.

## Ko-fi

1. Set **Ko-fi page** to your `https://ko-fi.com/...` address.
2. In Ko-fi's webhook settings, enter `<public URL>/api/v1/webhooks/kofi` as the URL. `/admin` shows the exact address. The public URL must be `https://`.
3. Copy Ko-fi's verification token into **Ko-fi verification token**. Until it is set, the webhook answers 404.
4. Under **Plans**, add a product for each thing you sell. One with a tier name matches Ko-fi membership payments of that tier, ignoring case. One without a tier name matches any one-off or monthly payment of at least its amount, in its currency.

Payments reach accounts in one of three ways:

- **Payment code.** The **Plan** page shows each person a code like `BAL-7KQ2M9XP` to paste in the Ko-fi message. The server reads the code from the message and doesn't keep the message.
- **Transaction ID.** Someone who forgot the code enters the payment's Ko-fi transaction ID, or the link with it in, under **Forgot the code?** on the same page.
- **Subscription renewals.** These have no message to go by, so once a subscription payment has reached an account by either way above, the server remembers the address Ko-fi reported and sends that address's later subscription payments to the same account. Nobody enters this address, it doesn't have to be the account's own, and one-off payments never go by it.

Each payment adds its days to what is left.

**Payments** lists everything Ko-fi sent. *Unclaimed* means nothing says whose it is yet and *unmatched* means no product fits; **Give to an account** settles either by hand. Ko-fi does not report refunds: after refunding someone, revoke the plan under **Accounts**.

Only the web app, and Android builds made to link to Ko-fi (see [Android release builds](/docs/apps/android/#two-builds)), show the Ko-fi page. The others show the plan and its limits only.

## Google Play

Only the app's `play` build sells these (see [Android release builds](/docs/apps/android/#two-builds)), and only for the package you publish it under.

1. In Play Console, create the subscriptions and activate a base plan for each.
2. In Google Cloud, create a service account and a JSON key for it. In Play Console, invite it under **Users and permissions** with permission to view financial data and to manage orders and subscriptions.
3. Under **Plans and payments**, set **Google Play package name** and paste the key into **Google Play service account**. Together they turn Google Play on.
4. Add a product under **Plans** with **Paid through** set to Google Play, the **Product ID** from Play Console, and the plan it buys. Google Play says when each payment ends, so a product has no days of its own.
5. For renewals and cancellations to arrive by themselves, create a Pub/Sub topic and give `google-play-developer-notifications@system.gserviceaccount.com` the Pub/Sub Publisher role on it, then enter the topic under **Monetization setup** in Play Console. Add a push subscription to `<public URL>/api/v1/webhooks/play` with authentication on, that same URL as its audience, and a service account of your own; enter that account's email as **Pub/Sub push account**. Without this, a renewal only arrives when its owner opens the plan page.

The server asks Google about every purchase and believes nothing else, so refunds and revocations made in Play Console reach it the same way. Revoking a plan under **Accounts** holds when Google reports on the purchase again, but it doesn't stop the subscription: cancel that in Play Console too.

## Payment records

Each payment keeps the payer's email and name. Set `BALNANA_PAYMENT_KEEP_DAYS` to erase them after that many days; the amount, date and plan stay, even if the account is deleted. An unclaimed payment can then only be claimed by its code or transaction ID. Choose the number with what your country requires of sales records, and say so in your privacy policy. Left out or 0, they are kept for good.

## Settings

All of these but the last are **admin** settings: they can also be set in `.env`, which wins over `/admin` (see [Configuration](/docs/self-hosting/configuration/)).

| Setting | In `/admin` | |
| --- | --- | --- |
| `BALNANA_BILLING_ENABLED` | Plans and limits | `true` turns plans on. Needs `BALNANA_AUTH_MODE=accounts`. |
| `BALNANA_KOFI_URL` | Ko-fi page | An `https://` address. Set it and the token together. |
| `BALNANA_KOFI_TOKEN` | Ko-fi verification token | |
| `BALNANA_PLAY_PACKAGE` | Google Play package name | |
| `BALNANA_PLAY_SERVICE_ACCOUNT` | Google Play service account | The service account's JSON key. |
| `BALNANA_PLAY_PUSH_ACCOUNT` | Pub/Sub push account | |
| `BALNANA_PAYMENT_KEEP_DAYS` | — | `.env` only. See [Payment records](#payment-records). |
