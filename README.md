# Setup

Start the services with `docker compose up -d` and create missing directories as necessary.
Use .env files to provide any missing environment variables to the compose stacks that require them.
Pass .env files with `docker compose --env-file`.

Inspect and solve network overlaps with

```bash
docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' $(docker ps -aq)
```

Passwords and secrets which are not provided by external services (i.e. DuckDNS, Telegram, Discord) can be generated using `openssl rand -hex 32`
