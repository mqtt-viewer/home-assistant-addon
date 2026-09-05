# MQTT Viewer Home Assistant add-on

Run [MQTT Viewer](https://github.com/mqtt-viewer/mqtt-viewer) on your Home
Assistant machine and use it from a browser.

This add-on installs `ghcr.io/mqtt-viewer/mqtt-viewer` at the version pinned
in [mqtt-viewer/config.yaml](mqtt-viewer/config.yaml). Each MQTT Viewer
release bumps that pin automatically, so the add-on tracks the app.

## Add the repository

Settings, Add-ons, Add-on store, three-dot menu, Repositories, then paste:

```
https://github.com/mqtt-viewer/home-assistant-addon
```

Then install "MQTT Viewer" from the store and open the web UI on port 8080.

Full instructions and security notes are in
[mqtt-viewer/DOCS.md](mqtt-viewer/DOCS.md).

## Issues

App bugs and feature requests belong in the
[main repository](https://github.com/mqtt-viewer/mqtt-viewer/issues).
Packaging problems with this add-on can be filed here. Please let me know if you have any issues.
