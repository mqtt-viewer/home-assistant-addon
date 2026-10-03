#!/bin/sh
# Verify the built image against a fresh Supervisor-style bind/volume root.
set -eu
image=${1:?built add-on image required}
name="mqtt-viewer-data-init-$$"
volume="$name-data"
cleanup() {
    docker rm -f "$name" >/dev/null 2>&1 || true
    docker volume rm "$volume" >/dev/null 2>&1 || true
}
trap cleanup EXIT INT TERM
docker volume create "$volume" >/dev/null
docker run --rm --user 0:0 --entrypoint sh -v "$volume:/data" "$image" -ec '
    chown 0:0 /data
    chmod 0755 /data
    printf supervisor-options > /data/options.json
    chmod 0600 /data/options.json
'
docker run -d --name "$name" --network none -v "$volume:/data" "$image" >/dev/null
wait_ready() {
    attempt=0
    until docker exec "$name" wget -q -O- http://127.0.0.1:8080/health >/dev/null; do
        attempt=$((attempt + 1))
        if [ "$attempt" -ge 30 ]; then docker logs "$name"; exit 1; fi
        sleep 1
    done
}
wait_ready
docker exec "$name" sh -ec '
    [ "$(awk "/^Uid:/ {print \$2}" /proc/1/status)" = 1000 ]
    [ "$(awk "/^Gid:/ {print \$2}" /proc/1/status)" = 1000 ]
    [ "$(awk "/^CapEff:/ {print \$2}" /proc/1/status)" = 0000000000000000 ]
    [ "$(stat -c "%u:%g:%a" /data)" = 1000:1000:755 ]
    [ "$(stat -c "%u:%g:%a" /data/options.json)" = 0:0:600 ]
    [ "$(cat /data/options.json)" = supervisor-options ]
'
before=$(docker exec --user 1000:1000 "$name" sha256sum /data/machine-id)
docker exec --user 1000:1000 "$name" sh -ec 'printf saved-data > /data/persistence-proof'
docker restart "$name" >/dev/null
wait_ready
[ "$(docker exec --user 1000:1000 "$name" sha256sum /data/machine-id)" = "$before" ]
[ "$(docker exec --user 1000:1000 "$name" cat /data/persistence-proof)" = saved-data ]
echo 'Fresh root-owned data, non-root app, permissions and restart persistence passed.'
