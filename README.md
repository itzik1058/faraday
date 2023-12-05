# Setup

Clone this repository then rename `.env.example` to `.env` and fill the variables.

| Environment Variable              | Description                                                                           |
| --------------------------------- | ------------------------------------------------------------------------------------- |
| `LOGS_PATH`                       | Path to logs directory                                                                |
| `DATA_PATH`                       | Path to service config and data directory                                             |
| `MEDIA_PATH`                      | Path to media/photos/documents directory                                              |
|                                   |                                                                                       |
| `RESTIC_REPOSITORY`               | Path to restic backup repository                                                      |
| `RESTIC_PASSWORD`                 | Password for restic repository                                                        |
|                                   |                                                                                       |
| `TZ`                              | Timezone used by docker services https://man7.org/linux/man-pages/man5/tzfile.5.html  |
| `PUID`                            | User id used by docker services (use `id -u` to find your user id)                    |
| `PGID`                            | Group id used by docker services (use `id -g` to find your group id)                  |
|                                   |                                                                                       |
| `DOMAIN`                          | Domain (e.g. example.duckdns.org)                                                     |
| `DUCKDNS_TOKEN`                   | duckdns.org token for LetsEncrypt certificates and dynamic dns                        |
| `DUCKDNS_EMAIL`                   | duckdns.org email                                                                     |
| `DUCKDNS_SUBDOMAINS`              | duckdns.org subdomains split by comma                                                 |
|                                   |                                                                                       |
| `AUTHELIA_JWT_SECRET`             | JWT secret                                                                            |
| `AUTHELIA_SESSION_SECRET`         | Session secret                                                                        |
| `AUTHELIA_STORAGE_ENCRYPTION_KEY` | Storage encryption key                                                                |
| `AUTHELIA_OIDC_HMAC_SECRET`       | OIDC HMAC secret                                                                      |
|                                   |                                                                                       |
| `WATCHTOWER_HTTP_API_TOKEN`       | API token                                                                             |
|                                   |                                                                                       |
| `TELEGRAM_BOT_TOKEN`              | Telegram bot token                                                                    |
| `TELEGRAM_CHAT_ID`                | Telegram chat id                                                                      |
|                                   |                                                                                       |
| `IMMICH_DB_PASSWORD`              | Database password                                                                     |
| `IMMICH_TYPESENSE_API_KEY`        | Typesense API key                                                                     |
|                                   |                                                                                       |
| `PAPERLESS_SECRET_KEY`            | Paperless secret                                                                      |
|                                   |                                                                                       |
| `SPEEDTEST_KEY`                   | Generate with `php artisan key:generate --show` in the speedtest-tracker container    |
| `SPEEDTEST_DB_DATABASE`           | Speedtest database schema                                                             |
| `SPEEDTEST_DB_USERNAME`           | Speedtest database username                                                           |
| `SPEEDTEST_DB_PASSWORD`           | Speedtest database password                                                           |
|                                   |                                                                                       |
| `RALLLY_SECRET`                   | Rallly secret token (16 characters)                                                   |
| `RALLLY_DB_PASSWORD`              | Rallly database password                                                              |
|                                   |                                                                                       |
| `MICROBIN_ADMIN_USERNAME`         | Microbin admin username                                                               |
| `MICROBIN_ADMIN_PASSWORD`         | Microbin admin password                                                               |
|                                   |                                                                                       |
| `WGER_SECRET_KEY`                 | WGER secret key                                                                       |
| `WGER_JWT_KEY`                    | WGER JWT secret                                                                       |
| `WGER_DB_PASSWORD`                | WGER database password                                                                |
|                                   |                                                                                       |
| `OMNIBOT_CLIENT_ID`               | Discord client id                                                                     |
| `OMNIBOT_DISCORD_TOKEN`           | Discord token                                                                         |
| `OMNIBOT_GUILD_ID`                | Discord guild id                                                                      |
| `OMNIBOT_CHANNEL_ID`              | Discord channel id                                                                    |

Passwords and secrets which are not provided by external services (i.e. DuckDNS, Telegram, Discord) can be generated using `openssl rand -hex 32`

---

Install the python requirements listed in `requirements.txt` and run `python render.py` to create the `docker-compose.yml` files.

Proceed to start the services with `docker compose up -d` and create missing directories as necessary.

## Backup
Initiate a restic repository, then update the environment variables with the path and password.

Run `backup.sh` to stop the docker service, backup, and restart docker.

## DuckDNS

DuckDNS provides a free subdomain of `duckdns.org`. Create an account and choose a subdomain name, then copy your account token.

## Authelia

Authelia configuration defaults to using `users.yml` in `$DATA_PATH/authelia`.

This behavior can be changed in the template at `reverse-proxy/authelia/configuration.yml.j2`.

The format for the users file database can be found in the Authelia documentation. Use `authelia hash-password` inside the docker container to generate user passwords.

## Streaming

Refer to [TRaSH-Guides](https://trash-guides.info/) for setup and recommended settings.

Recyclarr can be used to automatically sync settings.

### Intel Transcoding

https://github.com/intel/media-driver#components-and-features

To enable low-power for Jasper Lake a kernel parameter must be set
```bash
"options i915 enable_guc=2" > /etc/modprobe.d/i915.conf
```

## Photos

Use [Google Takeout](https://takeout.google.com/settings/takeout) to get receive an email with a download link to your Google Photos data.

Upload and index photos with Photosync or Immich.
