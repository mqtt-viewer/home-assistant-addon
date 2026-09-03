# MQTT Viewer Home Assistant add-on

Run [MQTT Viewer](https://github.com/mqtt-viewer/mqtt-viewer) on your Home
Assistant machine and use it through Home Assistant ingress.

**Status: waiting on the first published Docker image.** The manifest pins
`ghcr.io/mqtt-viewer/mqtt-viewer:1.3.0`, but that image tag is not published.
The add-on cannot install until the matching MQTT Viewer release publishes it.
The add-on version must match the image tag, so it remains at `1.3.0`.

## Add the repository

[![Open your Home Assistant instance and show the add-on store with this repository pre-filled.](https://my.home-assistant.io/badges/supervisor_store.svg)](https://my.home-assistant.io/redirect/supervisor_store/?repository_url=https%3A%2F%2Fgithub.com%2Fmqtt-viewer%2Fhome-assistant-addon)

Or add it manually: Settings, Add-ons, Add-on store, three-dot menu,
Repositories, then paste:

```
https://github.com/mqtt-viewer/home-assistant-addon
```

Install MQTT Viewer from the store, start it, then select **Open Web UI**. Home
Assistant serves the interface through ingress and requires Home Assistant
authentication. Direct host port access is disabled by default.

MQTT Viewer's broker-status device-monitoring control is hidden in browser
mode, including this add-on.

Full instructions and security notes are in
[mqtt-viewer/DOCS.md](mqtt-viewer/DOCS.md).

## Issues

App bugs and feature requests belong in the
[main repository](https://github.com/mqtt-viewer/mqtt-viewer/issues).
Packaging problems with this add-on can be filed here.
