# Dotfiles

Hey!

This is a collection of my personal configuration files for my environments.

The dotfiles are managed with [bois](https://github.com/Nukesor/bois).

## i3

### Layout

Use `i3-save-tree --workspace $NUMBER > /tmp/layout.json` to create a layout for a specific workspace.
See the [official docs](https://i3wm.org/docs/layout-saving.html) for more info.

### Window class

To get the window class for custom rules, use the `xprop` utility.

## Firefox

- Start firefox once and login.
- Copy the `user.js` into the `.mozilla/firefox/*.default-release/` folder.

## Nemo

To make `Open in Terminal` work with Nemo, run this:

`gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty`

## SSH

Setup with local `ssh-agent` user service.

Add this to `.ssh/config`:

```txt
AddKeysToAgent  yes
```

Add this to zshenv:

```sh
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
```
