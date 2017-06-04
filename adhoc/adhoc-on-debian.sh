#!/usr/bin/env bash

if ! sudo true
then
  echo 'Unable to obtain superuser privilege'
  exit 2
fi

sudo cp -n /etc/network/interfaces /etc/network/interfaces.backup

# randomIp=$(( RANDOM % 255 ))

sudo cp sample-interfaces  /etc/network/interfaces

sudo ifdown wlan0
sudo ifup wlan0

sudo iwlist wlan0 scan > /dev/null

# sudo ifconfig wlan0 up
# sudo ifconfig wlan0 down
# sudo ifconfig wlan0 up
# sudo ifconfig wlan0 down

# sudo ifconfig wlan0 down
# sudo iwconfig wlan0 channel 1 essid NDN mode ad-hoc
# sudo ifconfig wlan0 up
# sudo iwlist wlan0 scan > /dev/null
# sudo ifconfig wlan0 192.168.1.$randomIp netmask 255.255.255.0
