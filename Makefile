.PHONY: ncmpcpp config

basic:
	stow -t ~/.config -R config
	stow -t ~/ -R editorconf
	stow -t ~/ -R git
	stow -t ~/ -R mpd
	stow -t ~/ -R scripts
	stow -t ~/ -R various
	stow -t ~/ -R vim
	stow -t ~/ -R zsh

client: basic
	stow -t ~/ -R i3
	stow -t ~/ -R termite
	stow -t ~/ -R mpv
	stow -t ~/ -R x
	stow -t ~/ -R zsh-client

work: basic client
	stow -t ~/ -R zsh-work

server: basic
	stow -t ~/ -R zsh-server

