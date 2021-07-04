#!/bin/sh

# override the port from env var $PORT set randomly by heroku
PORT=5555
echo "running on port $PORT"
. /.venv/bin/activate
uwsgi --yaml app.yml