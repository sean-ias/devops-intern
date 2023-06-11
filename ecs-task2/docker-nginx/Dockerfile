FROM nginx:alpine

COPY ./default.conf.template /etc/nginx/conf.d/default.conf.template
COPY ./entrypoint.sh /entrypoint.sh

RUN apk add --no-cache jq && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]