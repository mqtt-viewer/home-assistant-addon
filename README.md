# MQTT Viewer Home Assistant add-on

Run [MQTT Viewer](https://github.com/mqtt-viewer/mqtt-viewer) on your Home
Assistant machine and use it through Home Assistant ingress.

This add-on installs `ghcr.io/mqtt-viewer/mqtt-viewer` at the version pinned
in [mqtt-viewer/config.yaml](mqtt-viewer/config.yaml). Each MQTT Viewer
release bumps that pin automatically, so the add-on tracks the app.

## Add the repository

[![Open your Home Assistant instance and show the add-on store with this repository pre-filled.](https://my.home-assistant.io/badges/supervisor_store.svg)](https://my.home-assistant.io/redirect/supervisor_store/?repository_url=https%3A%2F%2Fgithub.com%2Fmqtt-viewer%2Fhome-assistant-addon)

Or add it manually: Settings, Apps, Install app, three-dot menu, Repositories,
then paste:

```
https://github.com/mqtt-viewer/home-assistant-addon
```

Install MQTT Viewer, start it, then select **Open Web UI**. Home
Assistant serves the interface through ingress and requires Home Assistant
authentication. Direct host port access is disabled by default.

MQTT Viewer's broker-status device-monitoring control is hidden in browser
mode, including this add-on.

Full instructions and security notes are in
[mqtt-viewer/DOCS.md](mqtt-viewer/DOCS.md).

## Issues

App bugs and feature requests belong in the
[main repository](https://github.com/mqtt-viewer/mqtt-viewer/issues).
Packaging problems with this add-on can be filed here. Please let me know if you have any issues.
