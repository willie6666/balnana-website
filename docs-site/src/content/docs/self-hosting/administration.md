---
title: Administration
description: The /admin page, the administrator password, settings from the environment and moving them all to .env.
---

## The admin page

`/admin` asks for the administrator password (there is no username) and shows the server's settings:

- its public address, and link or accounts mode;
- password sign-in and sign-up;
- email (SMTP);
- Google and OpenID Connect sign-in;
- Android app links;
- maps and the privacy notice;
- [plans and payments](/docs/self-hosting/plans-and-payments/), when turned on;
- accounts, which the administrator can find and delete.

Changes apply at once, on every server process that shares the database. Nothing in the app links to `/admin`: open it by typing the address.

## Settings from the environment

Every setting can also be an environment variable in `.env`. **A variable that is set wins**: `/admin` shows its value but marks it as fixed. Leave a variable out to manage that setting from `/admin` instead. `.env.example` marks with `[admin]` which settings `/admin` can change.

### Settings from `.env` only

To keep the whole configuration in one file, set:

```ini
BALNANA_ENV_ONLY=true
```

The server then reads every `[admin]` setting from its environment alone. What was saved at `/admin` is ignored, though it stays in the database, and a setting `.env` leaves out takes its default. `/admin` still shows the settings, but dimmed: under **Environment file**, **Read settings from .env only** is on, and nothing can be changed there. Change a setting in `.env` and restart the server instead.

Plans, products, accounts and payments are not settings. They stay at `/admin` either way.

Only `.env` turns this on or off. With it on, a setting the server cannot accept stops it from starting, and the log says which one. Take the line out again and restart, and the settings saved at `/admin` are back in force.

### Export as .env

`/admin` writes the settings it saved as lines for `.env`, so nothing has to be typed again before turning `BALNANA_ENV_ONLY` on:

1. At `/admin`, choose **Export as .env**: the download button in the top bar, or the entry under **Environment file**.
2. Enter the administrator password again. `/admin` then saves a file named `balnana.env`.
3. Add the file's lines to the server's `.env`.
4. Add `BALNANA_ENV_ONLY=true` to `.env`.
5. Restart the server so it reads the file again:

   ```bash
   docker compose up -d
   ```

The file holds every setting saved at `/admin`, with its secrets: the SMTP password, sign-in provider secrets and payment keys. Settings the environment already sets are left out, as they are in `.env` already. Values are quoted the way both Docker Compose's `env_file` and systemd's `EnvironmentFile` read them, and a JSON key, such as the Google Play service account, is put on one line.

:::caution
`balnana.env` is as sensitive as `.env` itself. Delete the download once its lines are in place.
:::

## Lost the administrator password

Run:

```bash
docker compose exec balnana /balnana reset-admin
```

It signs everyone out of `/admin` and prints a new setup code. Open `/admin` and choose a new password with that code.

## Backups

The PostgreSQL database holds everything: groups, expenses, receipts, accounts, the settings made at `/admin` and the key that signs push notifications. Only your `.env` lives outside it, so keep a copy of that too. Back the database up regularly:

```bash
docker compose exec -T db pg_dump -U balnana -Fc balnana > balnana.dump
```

To bring a copy back, on this server or on a new one set up with the same `.env`:

```bash
docker compose stop balnana
docker compose exec -T db pg_restore -U balnana -d balnana --clean --if-exists --no-owner < balnana.dump
docker compose up -d
```

:::caution
A backup holds everyone's data and password hashes, so keep it as private as the server. If the push key is lost, phones get no notifications until they subscribe again.
:::

## Running more than one server

Run one. Several servers can share a database, but each keeps its own count of requests, password guesses, tries at claiming a payment and live connections, so with N servers those limits are N times what is set.
