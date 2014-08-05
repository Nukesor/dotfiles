# start X at login
#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR = 1
#        exec startx
#    end
#end

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

# SSH-Environment Variables
setenv SSH_ENV $HOME/.ssh/environment

# Adding new Identity if Agent is running
printenv | grep "SSH_AUTH_SOCK" > /dev/null
if [ $status -eq 0 ] 
    start_agent
end

#Setting 
eval (dircolors -c ~/.dir_colors)


