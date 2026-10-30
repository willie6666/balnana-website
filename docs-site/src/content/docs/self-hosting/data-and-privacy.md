---
title: Data and privacy
description: Account deletion, what happens to groups, and restoring a group that was deleted by mistake.
---

## Deleting accounts

People can change or add their email address and delete their account in the app, under **Settings → Account**. The web page `/delete-account` does the same after signing in, for app stores that ask for a deletion link. The administrator can find and delete accounts under `/admin` → Accounts.

When an account is deleted:

- its members stay in their groups, unclaimed, so balances still add up;
- a group it owned passes to the longest-standing member who has an account;
- groups nobody else can reach are deleted with it at once.

Group owners (or, in link mode, anyone with the link) can delete a whole group under its settings.

## Restoring a deleted group

Deleting a group from the app archives it: it disappears for everyone at once, but the server keeps it for **30 days**, then deletes it for good in its hourly cleanup. `/admin` has no list of archived groups and no restore button. Until the 30 days are up, restore one in the database by clearing its `archived_at`.

Find it by name:

```bash
docker compose exec db psql -U balnana balnana -c \
  "select id, name, archived_at from groups where archived_at is not null order by archived_at desc"
```

Then restore it by the token in its link (`.../g/<token>`):

```bash
docker compose exec db psql -U balnana balnana -c \
  "update groups set archived_at = null where token = '<token>'"
```

Open apps pick it up on their next reload.

:::note
Groups deleted together with an account, those nobody else could reach, are not archived. They can only come back from a [database backup](/docs/self-hosting/administration/#backups).
:::

## Privacy notice

The app links a privacy notice from its sign-in page and Settings → About. Set `BALNANA_PRIVACY_URL`, or the field under `/admin`, to your own policy. Without it the app shows a short built-in description of what the server stores, also reachable at `/privacy`.
