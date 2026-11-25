---
title: View-only link
description: Share a link that shows a group to anyone, with no account and no way to change anything.
---

A group's own link lets people change it. A view-only link only shows it. Anyone who opens it sees the group in their browser. They don't need an account, and they don't join the group.

Use it to show a trip's final balances to someone outside the group, or to keep a list of shared costs where people can check it.

On a server with [plans](/docs/self-hosting/plans-and-payments/) turned on, a view-only link needs a plan that includes it. Without one, the setting shows **Requires a higher plan** and opens the plan page.

## Creating the link

1. Open the group and go to **Group settings → Sharing → View-only link**.
2. Under **Updates**, choose how the link behaves:
   - **Kept up to date** shows the group as it is whenever someone opens the link.
   - **Snapshot** shows the group as it is now, and never changes.
3. Under **What it shows**, turn on what people should see.
4. Under **Works until**, you can pick a last day. Leave it empty to keep the link working until you turn it off.
5. Choose **Create link**, then copy or share it, or show its QR code.

A group has one view-only link at a time.

Who can manage it depends on the server, the same as the [group password](/docs/guides/group-password/):

- **Link mode**: anyone who can open the group.
- **Accounts mode**: any member of the group, signed in to their account.

## What it shows

| Setting | Shows | Starts |
|---|---|---|
| **Balances** | Each person's balance, and the payments that settle up | on |
| **Expenses** | The list of expenses, with search | on |
| **Spending** | The spending charts | on |
| **Expense notes** | Notes on each expense | off |
| **Expense places** | Where each expense was | off |
| **Receipt photos** | Receipt photos | off |

At least one of balances, expenses and spending stays on. Notes, places and receipt photos show only inside expenses, so they need **Expenses** on. Receipt photos work only with links that are kept up to date.

You can change these settings later, and the link keeps its address.

## Snapshots

A snapshot is taken when you create the link. Later expenses and changes don't appear in it. To show them, turn off the link and create a new one.

## Turning off the link

Choose **Turn off link**. It stops working at once, for everyone who has it. A new link has a different address.

A link with a last day stops working at the end of that day. People who open it then see **This link has expired**.

On a phone with the Balnana app connected to the same server, the link opens in the app; elsewhere it opens in the browser. See [App links](/docs/apps/connecting/#app-links).

If the group's plan stops including view-only links, the link is paused rather than removed: people see **This link is paused**, and it works again once the plan includes it.

## Privacy

- Anyone with the link can see what it shows, so share it the way you would share the group's own link.
- The group's password doesn't apply. The view-only link is a separate link that can't change anything.
- When the link is shared in a chat app, its preview says only that it is a Balnana group. The group's name isn't in it.
- The group's activity shows who created, changed or turned off the link.
