# -------------------- Plugins/External --------------------
# Run fzf keybindings first. CTRL+R will be overwritten by atuin.
if test -f "/usr/share/fish/vendor_functions.d/fzf_key_bindings.fish"
    source "/usr/share/fish/vendor_functions.d/fzf_key_bindings.fish"
end

# Prompt
eval "$(starship init fish)"
# Shared history
eval "$(atuin init fish --disable-up-arrow)"
# zoxide init + j alias for convenience
eval "$(zoxide init fish --cmd j)"

# -------------------- General configuration --------------------
# Vi bindings
fish_vi_key_bindings

# Theme
set fish_color_command green
set fish_color_param bwhite
set fish_color_comment grey
set fish_color_quote "#FF8C00"

# Disable greeting
set fish_greeting
# Disable autosuggestions
set -g fish_autosuggestion_enabled 0

# -------------------- Key bindings --------------------
# Since this config uses vi mode, all bindings also need
# to be set for the insert mode as well.

# Bind the file selection to CTRL-g
bind \cg git_file_list
bind -M insert \cg git_file_list

# Bind the branch selection to CTRL-b
bind \cb git_branch_list
bind -M insert \cb git_branch_list

# Call interactive directory selection on CTRL+p
bind \cp dirlist
bind -M insert \cp dirlist

# Call interactive directory selection on CTRL+f
bind \cf filelist
bind -M insert \cf filelist

# -------------------- Other stuff --------------------
# This is a way to start an alacritty shell with a custom command,
# while keeping an active zsh session.
# The alternative would be a `zsh -c $command`, which doesn't allow falling
# back to the shell and exits the terminal after closing vim.
if test -n $ROFI_COMMAND
   eval $ROFI_COMMAND
end
