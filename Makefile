.PHONY: ncmpcpp config

config: ncmpcpp
	stow -t ~/ git
	stow -t ~/ mpd
	stow -t ~/ i3
	stow -t ~/ scripts
	stow -t ~/ termite
	stow -t ~/ various
	stow -t ~/ vim
	stow -t ~/ x
	stow -t ~/ zsh

ncmpcpp:
	mkdir -p ~/.ncmpcpp
	stow -t ~/.ncmpcpp ncmpcpp

