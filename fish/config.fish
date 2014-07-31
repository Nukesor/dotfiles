# Disable greetings message 
set fish_greeting ""

# Set vim as default editor
set --export EDITOR "vim -f"

# Color grep output
set --export GREP_OPTIONS --color=auto

#sudo !! fix
function sudo
    if test "$argv" = !!
        echo "sudo " $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

# start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx
    end
end

# Enable keychain
set -gx HOSTNAME contamination
function chain
    if status --is-interactive;
        keychain --nogui --clear ~/.ssh/id_rsa
        [ -e $HOME/.keychain/$HOSTNAME-fish ]; and . $HOME/.keychain/$HOSTNAME-fish
    end
end

# Colorgcc
# set -x PATH "/usr/lib/colorgcc/bin:$PATH"

# SSH-Environment Variables
setenv SSH_ENV $HOME/.ssh/environment

# Adding new Identity if Agent is running
if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
end

eval (dircolors -c ~/.dir_colors)

