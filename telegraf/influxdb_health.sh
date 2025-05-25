#!/bin/bash

INFLUX_URL="http://192.168.0.111:8086/health"
influx_status=$(curl -s -o /dev/null -w "%{http_code}" "$INFLUX_URL")

influx_healthy=0

if [ "$influx_status" == "200" ]; then
  influx_healthy=1
fi

cat <<EOF
[
  {
    "measurement": "influx_health_check",
    "tags": {
      "service": "influxdb"
    },
      "status": $influx_healthy
  }
]
EOF
