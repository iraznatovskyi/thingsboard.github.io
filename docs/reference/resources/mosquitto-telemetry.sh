mosquitto_pub -d -q 1 -h "demo.thingsboard.io" -t "v1/devices/me/telemetry" -u "$ACCESS_TOKEN" -m "{"temperature":42}"