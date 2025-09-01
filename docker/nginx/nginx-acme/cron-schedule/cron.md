
# docker (renewal every 3 AM)
0 3 * * * cd /path/to/nginx-acme/ && docker compose run --rm acme acme.sh --cron --home /acme.sh && docker exec nginx nginx -s reload

# docker production internal network (renewal every 3 AM)
0 3 * * * "/home/nginx-user/.acme.sh"/acme.sh --cron --home "/home/nginx-user/.acme.sh" > /dev/null
