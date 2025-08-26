APP_NAME ?= app1
REDIS_PORT ?= 6379
REDIS_PASSWORD ?= usesecurepassword
REDIS_HOST ?= 127.0.0.1

.PHONY: init test

## Install redis-cli
init:
	sudo apt update && sudo apt install -y redis-tools

## Test Redis connection
test:
	@echo "Testing Redis connection on $(REDIS_HOST):$(REDIS_PORT)..."
	redis-cli -h $(REDIS_HOST) -p $(REDIS_PORT) -a $(REDIS_PASSWORD) PING
	redis-cli -h $(REDIS_HOST) -p $(REDIS_PORT) -a $(REDIS_PASSWORD) SET foo bar
	redis-cli -h $(REDIS_HOST) -p $(REDIS_PORT) -a $(REDIS_PASSWORD) GET foo
	redis-cli -h $(REDIS_HOST) -p $(REDIS_PORT) -a $(REDIS_PASSWORD) DEL foo
	@echo "Redis test done!"

