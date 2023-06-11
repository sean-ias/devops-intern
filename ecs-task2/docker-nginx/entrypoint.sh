#!/bin/sh

envsubst '${SIMPLE_ENV_VAR},${SECRET_ENV_VAR}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

SECRET_ENV_VAR_VALUE=$(echo $SECRET_ENV_VAR | jq -r '.SECRET_ENV_VAR')

echo "<html><head><title>Environment Variables</title></head><body><h1>Environment Variables</h1><p>SIMPLE_ENV_VAR: ${SIMPLE_ENV_VAR}</p><p>SECRET_ENV_VAR: ${SECRET_ENV_VAR_VALUE}</p></body></html>" > /usr/share/nginx/html/index.html

exec nginx -g 'daemon off;'