#!/bin/bash

DEVICE_VAR=$1

if [ -z "$DEVICE_VAR" ]; then
  echo "Usage: connect_bluetooth <DEVICE_VARIABLE_NAME>"
  echo "Available device variables: {list devices}"
  exit 1
fi

MAC_ADDRESS=${!DEVICE_VAR}

if [ -z "$MAC_ADDRESS" ]; then
  echo "No MAC address found for $DEVICE_VAR"
  exit 1
fi

echo -e "power on\nagent on\ndefault-agent\nconnect $MAC_ADDRESS\nexit" | bluetoothctl

