#!/bin/bash

#Sata Powermanagement
sudo tee /sys/class/scsi_host/host0/link_power_management_policy <<< 'min_power'
sudo tee /sys/class/scsi_host/host1/link_power_management_policy <<< 'min_power'
sudo tee /sys/class/scsi_host/host2/link_power_management_policy <<< 'min_power'
sudo tee /sys/class/scsi_host/host3/link_power_management_policy <<< 'min_power'
sudo tee /sys/class/scsi_host/host4/link_power_management_policy <<< 'min_power'
sudo tee /sys/class/scsi_host/host5/link_power_management_policy <<< 'min_power'


sudo tee /proc/sys/vm/dirty_writeback_centisecs <<< '1500'
sudo tee /proc/sys/kernel/nmi_watchdog <<< '0'
sudo tee /sys/module/snd_hda_intel/parameters/power_save <<< '1'

sudo tee /sys/bus/usb/devices/2-1.6/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:00.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:01.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:02.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:14.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:16.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:1a.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:1b.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:1c.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:1c.2/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:1c.3/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:1d.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:1f.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:00:1f.3/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:01:00.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:03:00.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:04:00.0/power/control <<< 'auto'
sudo tee /sys/bus/pci/devices/0000:04:00.2/power/control <<< 'auto'

