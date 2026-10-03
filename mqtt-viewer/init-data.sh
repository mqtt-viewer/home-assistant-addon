#!/bin/sh
# Supervisor creates the private /data bind mount as root. Initialise only
# that directory, then run the existing machine-id setup and app without root.
set -eu

if [ "$(id -u)" = 0 ]; then
    chown 1000:1000 /data
    exec su-exec 1000:1000 /usr/local/bin/entrypoint.sh "$@"
fi

exec /usr/local/bin/entrypoint.sh "$@"
