# Dotfiles

Hey!

This is a collection of my personal configuration files for my environments.

The dotfiles are managed with [toml-bombadil](https://github.com/oknozor/toml-bombadil) ([docs](https://oknozor.github.io/toml-bombadil/)).

## i3 Layout

Use `i3-save-tree --workspace $NUMBER > /tmp/layout.json` to create a layout for a specific workspace.
See the [official docs](https://i3wm.org/docs/layout-saving.html) for more info.

## Desktop manager

`lightdm` with `lightdm-webkit2-greeter` and **NO** theme.

`/etc/lightdm/lightdm.conf`
```txt
[Seat:*]
...
greeter-session = lightdm-webkit2-greeter
...
```

`/etc/lightdm/lightdm-webkit2-greeter.conf`
```txt
...
webkit_theme        = THEME HERE
...
```

## Firefox

- Non-fullscreen mode:
    Type about:config in the address bar, then search for "full-screen-api.ignore-widgets"
    Set that to true.

## SSH

Setup with local `ssh-agent` user service.

Add this to `.ssh/config`:
```
AddKeysToAgent  yes
```

Add this to zshenv:
```
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
```
