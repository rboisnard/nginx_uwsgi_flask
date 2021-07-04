#!/bin/sh

# get the port from env var $PORT set randomly by heroku
if [ -z $PORT ]; then
  PORT=80
fi

if [ -z $SERVER ]; then
  SERVER=nginx-uwsgi-flask.herokuapp.com
fi

if [ -z $BACKEND ]; then
  BACKEND=worker:5555
fi

sed -i -e "s/%PORT%/$PORT/" /etc/nginx/conf.d/default.conf
sed -i -e "s/%SERVER%/$SERVER/" /etc/nginx/conf.d/default.conf
sed -i -e "s/%BACKEND%/$BACKEND/" /etc/nginx/conf.d/default.conf

echo "running on port $PORT from $BACKEND"
/docker-entrypoint.sh nginx -g "daemon off;"