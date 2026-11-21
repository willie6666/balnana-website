---
title: Privacy policy
description: How Balnana handles your account, shared expenses, receipts, location and device data.
eyebrow: Your data, explained
updatedLabel: 'Effective and last updated:'
updated: November 21, 2026
date: '2026-11-21'
contents: On this page
---

**Balnana** is developed and its official services are operated by **willie6666**. For privacy questions and data requests, contact [balnana.com@gmail.com](mailto:balnana.com@gmail.com).

## Scope and responsibility

This policy covers the Balnana apps for Android and iOS, the official service at [app.balnana.com](https://app.balnana.com), and the official website at [balnana.com](https://balnana.com). It describes data handled when you use the official service, and data processed locally by the app.

Balnana also supports independently operated servers. If you connect to a self-hosted server, its operator determines how server-side data is stored, used, secured and deleted. Contact that operator and consult their policy; this policy does not govern their operation. The server you choose receives the account and group data you send to it.

## Data we process

- **Account and authentication:** display name, username, email address, verification status, password hash, login sessions, and security settings you enable, such as two-step verification. We store password hashes rather than plaintext passwords. If Google sign-in is available and you choose it, we process the Google account identifier, name, email address, verification status and profile-picture URL supplied by Google. If Sign in with Apple is available in the iOS app and you choose it, we process the Apple account identifier, the email address Apple shares, which can be a private relay address that forwards to yours, its verification status, and the name you let Apple share the first time you sign in.
- **Groups and financial records:** group and member names, currencies, expenses, amounts, payers, allocation of shares, recorded repayments, categories, notes, recurring expenses, invitations, and activity history. Recording a repayment does not itself transfer money.
- **Photos and receipts:** images you choose from your device or take with the camera and attach to an expense. Submitted receipts are uploaded to the selected server and converted into a resized JPEG. We do not scan your entire photo library.
- **Location:** place names and coordinates you add to an expense. We request access to the device location only when you choose “Use current location.” Only the location you subsequently confirm and save is attached to the expense. Balnana does not continuously track your location or access location in the background.
- **Notifications and device data:** when you enable push notifications, an app-generated installation identifier, push endpoint, delivery encryption keys, and group-notification subscriptions. These support delivery to your installation; they are not an advertising identifier, IMEI or phone number. The app also uses your notification, language, theme and timezone preferences where needed.
- **Service and security data:** network requests necessarily expose an IP address to the receiving server or service provider. The Balnana server uses IP-based rate limiting. Depending on logging settings, technical logs can include request time, method, masked path, response status, duration, and errors. Infrastructure providers can also receive IP addresses, browser or app information, and request metadata.
- **Purchases and support:** if you buy a plan or make a linked contribution, we process provider transaction references, purchase or subscription identifiers, product, amount, currency, payment status, entitlement dates, and any payer name or email the provider supplies. For App Store purchases, these come from transaction records signed by Apple, together with whether a purchase was a test (sandbox) purchase and an account token the app derives from your Balnana account so the purchase can be matched to it; Apple does not give us your Apple ID or payment card. If you contact us, we receive your email and the information you include.

## Why we use data

We use data to provide accounts and sign-in, synchronize and display groups, calculate balances and suggested settlements, store receipts and expense locations, send verification and password-reset emails and invitations, deliver notifications, manage paid plans, answer requests, and protect the service against abuse and errors.

We do not sell user data, use it for advertising, or integrate advertising or behavioral-analytics tools into Balnana. Official administrators do not proactively review users’ expense records, notes or receipts.

Where applicable law requires a legal basis, processing to provide the service is necessary to perform our agreement with you; proportionate security and maintenance rely on legitimate interests; optional permissions and features use consent where required; and legally required processing relies on the relevant legal obligation. You can decline optional permissions, with the corresponding feature unavailable.

## Who can see group content

Members with access to a group can see its member names, expenses, notes, receipts, saved locations and activity history. For a group that permits link access, anyone who obtains an active link can access it, subject to any group password or access requirements. Keep group links and passwords private and share them only with people you intend to grant access.

Content you export, share through another app, or send to another person is disclosed at your direction. Recipients may keep their own copies. Do not include another person’s personal data unless you have an appropriate basis to do so.

## Service providers and external connections

Providing the features below requires sending limited information to other services. This is separate from selling data or sharing it for advertising.

- **Hosting and email:** the official service uses a self-managed server in Taichung, Taiwan, and AWS S3 storage in the Taipei region, including backups. AWS SES delivers service emails and therefore processes the recipient address and email content. Cloudflare hosts and delivers the official website and processes the connection and request data needed to do so.
- **Google sign-in:** when offered and selected, authentication takes place through Google. Google receives the sign-in request and handles authentication under its own privacy policy; Balnana receives the identity information described above. Your Google password is not sent to Balnana.
- **Sign in with Apple:** in the iOS app, when offered and selected, authentication takes place through Apple, which handles it under its own privacy policy. Balnana receives the identity information described above, not your Apple ID password. If you choose to hide your email address, Apple forwards our service emails to you through its private email relay.
- **Maps:** opening an in-app map loads map styles and tiles from OpenFreeMap, or OpenStreetMap where used as a fallback. These services receive your network address and requests identifying the map area you view. Opening a location in an external map app or website sends the coordinates, and any included place label, to that destination.
- **Push delivery:** depending on your Android build and selected distributor, notifications use Google Firebase Cloud Messaging or a UnifiedPush service you choose, such as ntfy. Web notifications use your browser’s push service. Delivery services process endpoint identifiers, delivery metadata and encrypted notification payloads. Balnana encrypts the push message content before sending it to the delivery service.
- **Payments and contributions:** when you use an available purchase or contribution option, Google Play, the Apple App Store, PayPal or Ko-fi processes the transaction and exchanges the information needed to verify payment and assign your plan. For App Store subscriptions, Apple also notifies our server of renewals, refunds and expirations. The purchase flow does not send your full card details to Balnana. Those providers may retain their own transaction records after your Balnana account is deleted.
- **Links you follow:** external sites and apps, including source-code and donation links, receive the requests you initiate and operate under their own policies.

We do not send your group ledger or receipts to Google or Apple for sign-in, to map providers, or to payment providers as part of those features. Notification content is transmitted as encrypted push payloads. Hosting, storage and backup systems process the data they host.

We may also disclose information when required by applicable law or a valid legal request. External services handle the data they receive under their own terms and privacy policies.

## Storage, security and international use

Official application data is stored on the self-managed Taichung server and in AWS S3 in the Taipei region. Email, website delivery, sign-in, map, notification and payment providers may process information in other countries according to their operations. Global availability does not mean every provider processes information only in Taiwan.

The official service uses HTTPS for data in transit. Passwords are hashed, and access is controlled through sessions, group membership, links and any group passwords. The service processes readable group content on the server; group data is not end-to-end encrypted. Infrastructure administrators can technically access stored data, even though official administrators do not proactively read user content. No transmission or storage system can guarantee absolute security.

If you choose a self-hosted server, its operator controls the server’s security and transport configuration. Use a server and connection you trust.

## Data on your device and website

The app stores the selected server address, sign-in credentials or session tokens, preferences, group access information, and local group copies for offline use. Offline changes remain on the device until they can be synchronized. Removing the app or clearing its data removes its local storage; it does not delete server-side data, files you exported, or copies in other apps.

On iOS, Balnana stores session tokens in the device's Keychain and excludes offline group copies and pending expenses from Apple device backups. Pending expenses remain on the device across app updates until they can sync.

The official website stores language and theme preferences in browser local storage. Its expense-splitting demo runs in your browser without sending the demo entries to a ledger server. The web app also uses the session cookies and local storage needed for sign-in and application features. We do not use advertising or analytics cookies.

## Retention and deletion

- **Account deletion:** use **Settings → Account → Delete account** in the app, or visit [app.balnana.com/delete-account](https://app.balnana.com/delete-account) in a browser and sign in. The server deletes your account, password hash, linked sign-in identities, sessions, and associated account records, and detaches group membership from the deleted account. You can also email us to request deletion; we may need to verify that you control the account.
- **Shared groups after account deletion:** member names, shared expenses, notes, receipts, saved locations and activity history can remain in groups accessible to others so that their shared ledger still works. The member becomes unclaimed rather than being erased. Ownership passes to another eligible member. Groups no other account can access are deleted immediately, except where an active group link still permits access. Account deletion does not automatically erase all content you previously contributed to shared groups. Contact us for further personal-data removal requests.
- **Group deletion:** an authorized user can delete a group from group settings. The group immediately becomes inaccessible through the service and is retained in an archive for **30 days**, then permanently removed from the live database in the subsequent hourly cleanup. Related expenses, history and receipts are removed with it.
- **Expenses and receipts:** a deleted expense is soft-deleted and may be restored; its record and history can remain until the group is deleted. The receipt attached to a deleted expense is removed from the live database after **30 days**, in the subsequent cleanup. Explicitly removing a receipt deletes that receipt from the live database immediately.
- **Expired access data:** expired sessions, verification and reset tokens, invitations and temporary sign-in records are removed by periodic cleanup. This does not remove information already present in backups.
- **Payments:** account deletion removes the link between the account and retained payment-event records, but does not automatically erase the transaction record or any payer name or email it contains. Transaction records are retained for payment reconciliation and related requests; the software has no fixed automatic deletion period for the transaction record itself. Contact us about removal of personal information in these records. Deleting a Balnana account does not cancel a subscription at a payment provider; manage it with that provider.
- **Logs and backups:** official server logs and database backups, including backups stored in AWS S3, are currently kept **indefinitely**, without automatic expiry. Deleting an account, group or receipt from the live database does **not** automatically erase existing backup copies. Personal information in logs or backups can therefore remain indefinitely. Contact us to request further deletion and to confirm what can be removed. The 30-day cleanup described above applies to the live database, not every backup copy.

## Your choices and privacy requests

You can edit account information and group content where your access permits, export group data, disable notifications, revoke device permissions, and delete your account or groups as described above. Where applicable law provides these rights, you may request access, correction, a copy, deletion, restriction, or objection to processing, withdraw consent for consent-based processing, or complain to a competent data-protection authority. Withdrawal does not affect processing already lawfully completed.

Send requests to [balnana.com@gmail.com](mailto:balnana.com@gmail.com), identifying the official-service account and the information involved. Do not send passwords, one-time codes or unnecessary financial information. We may verify your identity and will explain relevant retention limits and respond within the period required by applicable law. For a self-hosted server, contact its operator.

## Age and children

Balnana is intended for people **13 years and older**. It is not directed at children under 13. We do not collect birth dates as part of normal registration or claim that every user’s age has been verified. Where local law requires a higher age or parental authorization, that requirement also applies. If you believe a child’s data has been provided inappropriately, contact us so we can investigate and address it.

## Changes and contact

We will update this page when our data practices change and revise the date above. Material changes will be communicated through the service where appropriate. The language links on this page provide English, Traditional Chinese and Simplified Chinese versions of this policy.

Developer and official-service operator: **willie6666**  
App: **Balnana**  
Privacy contact: [balnana.com@gmail.com](mailto:balnana.com@gmail.com)
