.PHONY: basic default boot-grub boot-efi advanced install-pkg user

default:

basic:
	# Setzen der Lokalzeit
	ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
	# Setzen des encodings
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
	echo "LANG=en_US.UTF-8" > /etc/locale.conf
	locale-gen
	# Setzen der Keymap
	echo "KEYMAP=us" > /etc/vconsole.conf
	echo "FONT=ter-112n" >> /etc/vconsole.conf

boot-grub:
	pacman -Sy grub --needed --noconfirm
	grub-install --target=i386-pc --recheck --debug /dev/sdd # Hier Device einsetzen
	grub-mkconfig -o /boot/grub/grub.cfg

boot-efi:
	# Not finnished yet
	pacman -S gummiboot --needed --noconfirm
	gummiboot --path=/boot/ install

advanced:
	# Downloading fish and setting it as default shell
	pacman -Sy base-devel fish sudo --needed --noconfirm
	chsh -s /usr/bin/fish
	# Copying etc
	cp -rf --preserve /mnt/etc/* /etc/
	# Adding and signing Haskell repository for pacman
	pacman-key -r 4209170B
	pacman-key --lsign-key 4209170B
	pacman -Syy
	pacman -S yaourt --noconfirm

install-pkg:
	fish install.fish

user:
	# Kopieren der Home Backup Daten
	cp -r --preserve /mnt/home /home/nukesor
	# Erstellen von user Nukesor und setzen der Standartshell
	groupadd nukesor
	useradd -d /home/nukesor -g nukesor nukesor
	chsh -s /usr/bin/fish nukesor

everything-grub: basic boot-grub advanced install-pkg user	

