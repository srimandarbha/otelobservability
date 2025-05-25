#!/bin/bash

HOST="192.168.0.111"
PORT=9092

if exec 3<>/dev/tcp/$HOST/$PORT; then
  status=1
else
  status=0
fi

cat <<EOF
[
  {
    "measurement": "health_check",
    "tags": {
      "service": "kafka"
    },
    "status": $status
  }
]
EOF
