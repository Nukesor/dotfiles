.PHONY: ncmpcpp config

config: ncmpcpp
	stow git
	stow mpd
	stow i3
	stow scripts
	stow termite
	stow various
	stow vim
	stow x
	stow zsh

ncmpcpp:
	mkdir -p ~/.ncmpcpp
	stow -t ~/.ncmpcpp ncmpcpp

