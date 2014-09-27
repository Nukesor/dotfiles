default: basic

basic:
	ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
	locale-gen
	echo "KEYMAP=us-qwerty" > /etc/vconsole.conf
	pacman -S grub
	grub-install --target=i386-pc --recheck --debug /dev/sdd # Hier Device einsetzen
	grub-mkconfig -o /boot/grub/grub.cfg

advanced:
	# Downloading fish and setting it as default shell
	pacman -S fish sudo
	chsh -s /usr/bin/fish
	# Copying etc
	cp -rf /mnt/etc/* /etc/
	# Adding and signing Haskell repository for pacman
	pacman-key -r 4209170B
	pacman-key --lsign-key 4209170B
	pacman -Syy

install-pkg:
	fish install.fish

user:
	mkdir /home/nukesor
	groupadd nukesor
	useradd -d /home/nukesor -g nukesor nukesor
	chsh -s /usr/bin/fish nukesor
	cp -r --preserve /mnt/home /home/nukesor

everything: basic advanced install-pkg user home-dir
	
