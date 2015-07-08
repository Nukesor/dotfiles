.PHONY: ncmpcpp config

basic:
	stow -t ~/.config config
	stow -t ~/ editorconf
	stow -t ~/ git
	stow -t ~/ scripts
	stow -t ~/ various
	stow -t ~/ vim
	stow -t ~/ zsh

client: basic
	stow -t ~/ i3
	stow -t ~/ termite
	stow -t ~/ mpd
	stow -t ~/ mpv
	stow -t ~/ x
	stow -t ~/ zsh-client

work: basic client
	stow -t ~/ zsh-work

server: basic
	stow -t ~/ zsh-server

