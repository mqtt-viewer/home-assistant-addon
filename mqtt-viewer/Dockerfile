# Supervisor supplies BUILD_VERSION from config.yaml. Reuse the published app
# binary and assets, with only the Home Assistant volume initialisation added.
ARG BUILD_VERSION=1.1.0
FROM ghcr.io/mqtt-viewer/mqtt-viewer:${BUILD_VERSION}

USER root
RUN apk add --no-cache su-exec
COPY init-data.sh /usr/local/bin/ha-init-data.sh
RUN chmod 0755 /usr/local/bin/ha-init-data.sh

ARG BUILD_VERSION
ARG BUILD_ARCH
LABEL io.hass.version="${BUILD_VERSION}" \
      io.hass.type="app" \
      io.hass.arch="${BUILD_ARCH}"

ENTRYPOINT ["/usr/local/bin/ha-init-data.sh"]
CMD ["/usr/local/bin/mqtt-viewer"]
