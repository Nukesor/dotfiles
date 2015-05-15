.PHONY: basic default boot-grub boot-efi advanced install-pkg user setup HD-setup basic-install

default:

basic:
	./scripts/basic.sh

boot-grub:
	./scripts/grub.sh
	
advanced:
	./scripts/advanced.sh

install-pkg:
	./scripts/install.sh

yaourt-pkg:
	./scripts/yaourt.sh

user:
	./scripts/user.sh

everything-grub: basic boot-grub advanced install-pkg user	

HD-setup:
	./scripts/grub-partition.sh
	./scripts/hd-setup.sh

basic-install:
	./scripts/basic-install.sh

setup: HD-setup basic-install

