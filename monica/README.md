# Monica [(docs)](https://github.com/monicahq/docker)

Generate app key
```
echo -n 'base64:'; openssl rand -base64 32
```

Register on first visit, then run
```
docker compose exec monica php artisan setup:production
```