# MQTT Viewer add-on

Runs [MQTT Viewer](https://github.com/mqtt-viewer/mqtt-viewer) as a web app on
your Home Assistant machine.

## Availability

The add-on manifest pins `ghcr.io/mqtt-viewer/mqtt-viewer:1.3.0`. That image tag
is not published yet, so Home Assistant cannot install the add-on. The add-on
version must match a published image tag. It remains at `1.3.0` while waiting
for the matching MQTT Viewer release.

## Installation

1. Add this repository to the add-on store: Settings, Add-ons, Add-on store,
   three-dot menu, Repositories, then paste
   `https://github.com/mqtt-viewer/home-assistant-addon`.
2. Install the MQTT Viewer add-on and start it.
3. Select **Open Web UI**.

Home Assistant opens MQTT Viewer through ingress. The interface is protected by
your Home Assistant authentication.

## Connecting to your broker

Add a connection in the app the same way as the desktop version. For the
Mosquitto broker add-on, use `core-mosquitto` as the host and `1883` as the
port.

## Browser-mode differences

The desktop app opens charts in separate windows. Here they open as browser
tabs through ingress, and re-opening the same chart focuses its existing tab.
The broker-status device-monitoring control is hidden in browser mode.

## Data

Saved connections, settings and message recordings live in the add-on's private
`/data` directory. They survive updates and restarts. Uninstalling the add-on
deletes them.

## Security

Ingress puts the interface behind Home Assistant authentication. The add-on
runs without host networking or extra privileges, and its direct host port is
disabled by default.

A user can expose port 8080 from the add-on's Network settings for testing.
Direct access bypasses Home Assistant ingress and its authentication, so only
expose it on a trusted network and remove the mapping after testing.

## Updates

The add-on version tracks the MQTT Viewer image tag it runs. Update from the
add-on page when a new version appears.
