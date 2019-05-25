#!/bin/bash
sudo cp ./xbox_bt.conf /etc/modprobe.d/
sudo systemctl start xboxdrv.service
sudo systemctl start bluetooth.service
sudo modprobe btusb
sudo modprobe xboxdrv
