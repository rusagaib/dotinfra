#!/bin/sh

# Generate redis.conf dari template
envsubst < /usr/local/etc/redis/redis.conf.template > /usr/local/etc/redis/redis.conf

# Jalankan Redis server dengan config yang sudah digenerate
exec redis-server /usr/local/etc/redis/redis.conf

