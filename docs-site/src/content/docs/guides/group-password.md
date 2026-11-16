---
title: Group password
description: Ask for a password before a group's link opens it, so the link alone is no longer enough.
---

A group's link is all anyone needs to open it. With a group password, the link alone no longer opens the group: Balnana asks for the password first.

## Setting a password

1. Open the group and go to **Group settings → Sharing → Group password**.
2. Enter the password and choose **Save**.
3. Share the password with the group, separately from the link.

Who can set it depends on the server:

- **Link mode**: anyone who can open the group.
- **Accounts mode**: the group's owner. When the group has no owner left, any member signed in to their account can.

To change or remove it later, choose **Group password** again.

## Opening a group with a password

Anyone who opens the group by its link sees **This group has a password**. They enter it and choose **Open group**. This covers every group in link mode, and groups in accounts mode that are [open to anyone with the link](/docs/self-hosting/access-and-sign-in/#accounts-mode).

Each device asks once, and then remembers the group. That includes people who were already using the group on that device before it had a password: they enter it once too.

Members signed in to their accounts don't need it.

Wrong guesses are limited, the same way as for sign-in passwords.

## Changing the password

Choosing a new password logs out every device that opened the group with the old one, except the device you changed it on. Those devices show the group as **This group has a password** in the group list until someone enters the new password there.

## Removing the password

Choose **Group password → Remove**. The link alone opens the group again, for everyone who has it.

## Resetting the link

**Reset link** makes a new link and stops the old one working. The password stays as it is, and the device that reset the link stays unlocked. Share the new link, and the password, with people who should keep access.

:::caution
A password doesn't help if it travels with the link. Send it another way, such as in person or in a different chat.
:::
