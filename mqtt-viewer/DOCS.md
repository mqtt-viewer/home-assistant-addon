# MQTT Viewer add-on

Runs [MQTT Viewer](https://github.com/mqtt-viewer/mqtt-viewer) as a web app on
your Home Assistant machine.

## Installation

1. Add this repository to the add-on store:
   Settings, Add-ons, Add-on store, three-dot menu, Repositories, then paste
   `https://github.com/mqtt-viewer/home-assistant-addon`.
2. Install the MQTT Viewer add-on and start it.
3. Open the web UI on port 8080 (the "Open web UI" button).

## Connecting to your broker

Add a connection in the app the same way as the desktop version. For the
Mosquitto broker add-on, the host is `core-mosquitto` and the port 1883.

## Data

Everything you save (connections, settings, message recordings) lives in the
add-on's private `/data` directory and survives updates and restarts.
Uninstalling the add-on deletes it.

## Security

The web UI has no login of its own. The add-on publishes port 8080 on your
Home Assistant host, so anyone on your network who can reach that port can use
your saved connections. Keep it to a trusted network or firewall the port.
Ingress support (which would put the UI behind Home Assistant's own login) is
planned; follow
[issue #119](https://github.com/mqtt-viewer/mqtt-viewer/issues/119).

## Updates

The add-on version tracks the MQTT Viewer release it runs. Update from the
add-on page when a new version appears.
