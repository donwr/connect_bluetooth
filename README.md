# Bluetooth Connection Script

This repository contains a shell script that allows you to connect to Bluetooth devices using predefined environment variables. This setup is useful for quickly connecting to your commonly used Bluetooth devices from the command line.

## Setup

### Step 1: Define Environment Variables

Add the MAC addresses of your Bluetooth devices to your `.bashrc` file as environment variables. Open your `.bashrc` file with your preferred text editor:

nano ~/.bashrc
Add the following lines, replacing the placeholders with the actual MAC addresses of your devices:


export HEADPHONES="XX:XX:XX:XX:XX:XX"
export SPEAKER="YY:YY:YY:YY:YY:YY"
export MOUSE="ZZ:ZZ:ZZ:ZZ:ZZ:ZZ"
Save the file and reload your .bashrc to apply the changes:

source ~/.bashrc
Step 2: Create the Shell Script
Create a shell script named connect_bluetooth.sh with the following content:

#!/bin/bash

DEVICE_VAR=$1

if [ -z "$DEVICE_VAR" ]; then
  echo "Usage: connect_bluetooth <DEVICE_VARIABLE_NAME>"
  echo "Available device variables: HEADPHONES, SPEAKER, MOUSE"
  exit 1
fi

MAC_ADDRESS=${!DEVICE_VAR}

if [ -z "$MAC_ADDRESS" ]; then
  echo "No MAC address found for $DEVICE_VAR"
  exit 1
fi

echo -e "power on\nagent on\ndefault-agent\nconnect $MAC_ADDRESS\nexit" | bluetoothctl
Make the script executable:

chmod +x connect_bluetooth.sh
Step 3: Move the Script to Your PATH
Move the script to a directory that is included in your PATH, for example, /usr/local/bin:

sudo mv connect_bluetooth.sh /usr/local/bin/connect_bluetooth
Usage
To connect to a Bluetooth device, use the connect_bluetooth command followed by the name of the environment variable you defined:

connect_bluetooth HEADPHONES
connect_bluetooth SPEAKER
connect_bluetooth MOUSE

Adding More Devices
To add more devices, simply define new environment variables in your .bashrc file and reload it:

export NEW_DEVICE="AA:BB:CC:DD:EE:FF"
source ~/.bashrc
You can then connect to the new device using:

connect_bluetooth NEW_DEVICE

Create a shell script named disconnect_bluetooth.sh with the following content:

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
Make the script executable:

chmod +x disconnect_bluetooth.sh

Move the script to a directory that is included in your PATH, for example, /usr/local/bin:

sudo mv disconnect_bluetooth.sh /usr/local/bin/disconnect_bluetooth

To disconnect from a Bluetooth device, use the disconnect_bluetooth command followed by the name of the environment variable you defined:

disconnect_bluetooth HEADPHONES
disconnect_bluetooth SPEAKER
disconnect_bluetooth MOUSE

Troubleshooting
Ensure that Bluetooth is enabled on your device.
Make sure the MAC address is correctly specified in the environment variable.
Verify that the bluetoothctl utility is installed and functioning on your system.
