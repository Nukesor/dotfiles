sudo rm -f /etc/modprobe.d/audio_powersave.conf
sudo echo "options snd_hda_intel power_save=5" > /etc/modprobe.d/audio_powersave.conf

sudo rm -f /etc/modprobe.d/nobeep.conf
sudo echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

sudo rm -f /etc/modprobe.d/video.conf
sudo echo "blacklist uvcvideo" > /etc/modprobe.d/video.conf

sudo rm -f /etc/sysctl.d/dirty.conf
sudo echo "vm.dirty_writeback_centisecs = 6000" > /etc/sysctl.d/dirty.conf

sudo rm -f /etc/sysctl.d/laptop.conf
sudo echo "vm.laptop_mode = 5" > /etc/sysctl.d/laptop.conf

sudo rm -f /etc/udev/rules.d/70-disable_wol.rules
sudo echo 'ACTION=="add", SUBSYSTEM=="net", KERNEL=="eth*", RUN+="/usr/bin/ethtool -s %k wol d"' > /etc/udev/rules.d/70-disable_wol.rules

sudo rm -f /etc/udev/rules.d/70-wifi-powersave.rules
sudo echo 'ACTION=="add", SUBSYSTEM=="net", KERNEL=="wlan*", RUN+="/usr/bin/iw dev %k set power_save on"' > /etc/udev/rules.d/70-wifi-powersave.rules


