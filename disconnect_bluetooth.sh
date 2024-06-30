#!/bin/bash

DEVICE_VAR=$1

if [ -z "$DEVICE_VAR" ]; then
  echo "Usage: disconnect_bluetooth <DEVICE_VARIABLE_NAME>"
  echo "Available device variables: HEADPHONES, SPEAKER, MOUSE"
  exit 1
fi

MAC_ADDRESS=${!DEVICE_VAR}

if [ -z "$MAC_ADDRESS" ]; then
  echo "No MAC address found for $DEVICE_VAR"
  exit 1
fi

echo -e "disconnect $MAC_ADDRESS\nexit" | bluetoothctl

