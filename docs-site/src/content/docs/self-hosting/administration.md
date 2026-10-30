---
title: Administration
description: The /admin page, the administrator password and how settings from the environment interact with it.
---

## The admin page

`/admin` asks for the administrator password (there is no username) and shows the server's settings:

- its public address, and link or accounts mode;
- password sign-in and sign-up;
- email (SMTP);
- Google and OpenID Connect sign-in;
- Android app links;
- maps and the privacy notice;
- accounts, which the administrator can find and delete.

Changes apply at once, on every server process that shares the database. Nothing in the app links to `/admin`: open it by typing the address.

## Settings from the environment

Every setting can also be an environment variable in `.env`. **A variable that is set wins**: `/admin` shows its value but marks it as fixed. Leave a variable out to manage that setting from `/admin` instead. `.env.example` marks with `[admin]` which settings `/admin` can change.

## Lost the administrator password

Run:

```bash
docker compose exec balnana /balnana reset-admin
```

It signs everyone out of `/admin` and prints a new setup code. Open `/admin` and choose a new password with that code.

## Backups

The PostgreSQL database holds everything: groups, expenses, receipts, accounts and settings. Back it up regularly:

```bash
docker compose exec db pg_dump -U balnana balnana > backup.sql
```
