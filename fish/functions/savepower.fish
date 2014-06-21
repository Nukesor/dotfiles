function savepower
	command sudo echo '1' > '/sys/module/snd_hda_intel/parameters/power_save'
    command sudo echo 'min_power' > '/sys/class/scsi_host/host0/link_power_management_policy'
    command sudo echo 'min_power' > '/sys/class/scsi_host/host1/link_power_management_policy'
    command sudo echo 'min_power' > '/sys/class/scsi_host/host2/link_power_management_policy'
    command sudo echo 'min_power' > '/sys/class/scsi_host/host3/link_power_management_policy'
    command sudo echo 'min_power' > '/sys/class/scsi_host/host4/link_power_management_policy'
    command sudo echo 'min_power' > '/sys/class/scsi_host/host5/link_power_management_policy'
    command sudo echo 'auto' > /sys/bus/pci/devices/0000:03:00.0/power/control'
    command sudo echo 'auto' > /sys/bus/pci/devices/0000:04:00.0/power/control'
    command sudo echo 'auto' > /sys/bus/pci/devices/0000:00:1b.0/power/control'
    command sudo echo 'auto' > /sys/bus/pci/devices/0000:00:00.0/power/control'
end
