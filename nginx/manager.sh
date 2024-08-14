#!/bin/bash

set -e

echo "Checking for dhparams.pem"
if [ ! -f "/vol/proxy/ssl-dhparams.pem" ]; then
  echo "dhparams.pem does not exist - creating it"
  openssl dhparam -out /vol/proxy/ssl-dhparams.pem 2048
fi

echo "Checking for fullchain.pem"
if [ ! -f "/etc/letsencrypt/live/${DOMAIN}/fullchain.pem" ]; then
  echo "No SSL cert, enabling HTTP only..."
  envsubst '' < /etc/nginx/nginx.dev.conf > /etc/nginx/conf.d/default.conf
else
  echo "SSL cert exists, enabling HTTPS..."
  envsubst '${DOMAIN}' < /etc/nginx/nginx.prod.conf > /etc/nginx/conf.d/default.conf
fi


inotifywait -m -e close_write /etc/nginx/ |
while read path action file; do
    echo "Changes in nginx configuration detected, reloading nginx!"
    nginx -s reload
done &

nginx-debug -g 'daemon off;'
