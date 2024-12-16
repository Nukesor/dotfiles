# -------------------- Shell Helper Abbreviations --------------------

# Pipe everything to /dev/null
abbr --position anywhere --add "p0" "&> /dev/null"
abbr --position anywhere --add "pb" "| bat"

# Mirror zsh's !! functionality
function last_history_item
    echo $history[1]
end
abbr --position anywhere -a "!!" --function last_history_item

# -------------------- Command Abbreviations --------------------
abbr --add 'jf' 'sudo journalctl -f -u'
abbr --add 'jb' 'sudo journalctl -b -u'
abbr --add 'sys' 'sudo systemctl'
abbr --add 'sysu' 'systemctl --user'

abbr --add --set-cursor='%' 'pad' 'pueue add -- "%"'

# -------------------- Git abbreviations --------------------
abbr --add 'gf' 'git commit --fixup'
abbr --add --set-cursor='%' 'gcm' 'git commit -m "%"'
