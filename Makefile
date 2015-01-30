.PHONY: ncmpcpp config

config: ncmpcpp
	stow -t ~/ git
	stow -t ~/ mpd
	stow -t ~/ i3
	stow -t ~/ scripts
	stow -t ~/ termite
	stow -t ~/ various
	stow -t ~/ varall
	stow -t ~/ vim
	stow -t ~/ x
	stow -t ~/ zsh
	stow -t ~/.config config

ncmpcpp:
	mkdir -p ~/.ncmpcpp
	stow -t ~/.ncmpcpp ncmpcpp

server:
	stow -t ~/.config config
	stow -t ~/ szsh
	stow -t ~/ vim
	stow -t ~/ git
	stow -t ~/ varall

