# Setup

Start the services with `./compose.sh up -d` (optionally specify `--profile`) and create missing directories as necessary.

Use `.env` to provide any missing environment variables to the compose stacks that require them.

`.env` is encrypted using [SOPS](https://github.com/getsops/sops) and `./compose.sh` runs docker compose with `.env` decrypted.

Inspect and solve network overlaps with

```bash
docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' $(docker ps -aq)
```

Passwords and secrets which are not provided by external services (i.e. DuckDNS, Telegram, Discord) can be generated using `openssl rand -hex 32`
