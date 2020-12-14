#!/bin/sh -
set -e

if [ -f tmp/pids/server.pid ]; then
  echo "Nuke server.pid"
  rm tmp/pids/server.pid
fi

bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

exec bundle exec "$@"
