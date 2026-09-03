# MQTT Viewer add-on

Runs [MQTT Viewer](https://github.com/mqtt-viewer/mqtt-viewer) as a web app on
your Home Assistant machine.

## Availability

The add-on manifest pins `ghcr.io/mqtt-viewer/mqtt-viewer:1.3.0`. That image tag
is not published yet, so Home Assistant cannot install the add-on. The add-on
version must match a published image tag. It remains at `1.3.0` while waiting
for the matching MQTT Viewer release.

## Installation

1. Go to Settings, Apps, Install app, then open the three-dot menu and select
   Repositories. Paste `https://github.com/mqtt-viewer/home-assistant-addon`.
2. Install the MQTT Viewer app and start it.
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

### TLS certificate paths

The desktop certificate fields use a native file picker. A browser cannot open
that picker. Place the CA certificate, client certificate and client key in
MQTT Viewer's app configuration folder under `/addon_configs`. Home Assistant
mounts that folder read-only at `/config` inside the app. Enter paths such as
`/config/ca.pem` or `/config/client.key` in the connection's TLS settings.

## Data

Saved connections, settings and message recordings live in the add-on's private
`/data` directory. They survive updates and restarts. Uninstalling the add-on
deletes them.

## Security

Ingress puts the interface behind Home Assistant authentication. The add-on
runs without host networking or extra privileges, and its direct host port is
disabled by default.

A user can expose port 8080 from the add-on's Network settings for testing.
Direct access bypasses Home Assistant ingress and its authentication. Anyone
who can reach the port can control MQTT Viewer, read saved broker passwords and
use its connections without signing in. Another page open in the same browser
can also connect to the event stream and read live MQTT traffic. Only expose
the port on a trusted network and remove the mapping after testing.

## Updates

The add-on version tracks the MQTT Viewer image tag it runs. Update from the
add-on page when a new version appears.
