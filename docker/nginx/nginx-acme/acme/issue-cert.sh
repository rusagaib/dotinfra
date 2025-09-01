#!/bin/sh

set -e

DOMAIN="${CF_DOMAIN}"
WILDCARD="${CF_WC_DOMAIN}"

export CF_Token="${CF_TOKEN}"
# export CF_Account_ID="$CF_Account_ID"

# Issue cert DNS challenge (Cloudflare)
acme.sh --register-account -m your@email.com --server letsencrypt

acme.sh --issue --dns dns_cf --server letsencrypt -d "$DOMAIN" -d "$WILDCARD"

# Install cert to mounted volume
acme.sh --install-cert -d "$DOMAIN" \
  --key-file       /acme.sh/$DOMAIN.key \
  --fullchain-file /acme.sh/$DOMAIN.crt \
  --reloadcmd      "nginx -s reload || true"

