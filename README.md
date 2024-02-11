# Setup

Start the services with `docker compose up -d` and create missing directories as necessary.
Use .env files to provide any missing environment variables to the compose stacks that require them.

Passwords and secrets which are not provided by external services (i.e. DuckDNS, Telegram, Discord) can be generated using `openssl rand -hex 32`

## Backup
Initiate a restic repository, then update the environment variables with the path and password.

Run `backup.sh` to stop the docker service, backup, and restart docker.

## Adguard Home
For initial configuration open a browser and connect on port 3000 (LAN only).

Configure DNS settings in router LAN settings and point to the host IP, also do not enable advertising router's IP in addition to user-specified DNS.

## DuckDNS

DuckDNS provides a free subdomain of `duckdns.org`. Create an account and choose a subdomain name, then copy your account token.

## Authelia

Authelia configuration defaults to using `users.yml` in `$APP_DATA_PATH/authelia/data`.

This behavior can be changed in the template at `$APP_DATA_PATH/authelia/config/configuration.yml`.

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
