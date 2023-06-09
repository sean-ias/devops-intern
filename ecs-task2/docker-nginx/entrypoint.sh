#!/bin/sh

envsubst '${SIMPLE_ENV_VAR},${SECRET_ENV_VAR}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

echo "SIMPLE_ENV_VAR: ${SIMPLE_ENV_VAR}" > /usr/share/nginx/html/index.html
echo "SECRET_ENV_VAR: ${SECRET_ENV_VAR}" >> /usr/share/nginx/html/index.html

exec nginx -g 'daemon off;'