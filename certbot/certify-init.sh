#!/bin/sh



set -e

echo "Getting certificate..."

certbot certonly \
    --webroot \
    --webroot-path "/vol/www/" \
    -d "$DOMAIN" \
    --email $EMAIL \
    --rsa-key-size 4096 \
    --agree-tos \
    --noninteractive

echo "Setting up auto-renewal..."

apk add --no-cache dcron
echo "0 12 * * * /usr/bin/certbot renew --quiet" | crontab -
crond -b