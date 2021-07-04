FROM nginx:alpine

COPY default.conf /etc/nginx/conf.d/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]