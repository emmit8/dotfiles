# Functions
# --------- 

# Function to make XTERM colour 
# Color         Fg  Bg
# -----         --  --
# Black         30  40
# Red           31  41
# Green         32  42
# Yellow        33  43
# Blue          34  44
# Magenta       35  45
# Cyan          36  46
# White         37  47

xc() {
    local weight=0
    local colour="\[\033[0m\]"
    
    if [ "$2" = "bold" ] ; then
        weight=1
    fi
if ! [ "$1" = "-" ] ; then 
        colour="\[\033[$weight;$1m\]"
    fi 

    echo -n $colour
}

# Exports
# -------
export HISTSIZE=4096
export PS1="$(xc 31)\w\n$(xc 34 bold)> $(xc -)"
export CLICOLOR=1
export HOMEBREW_NO_EMOJI=1

unset -f xc

# Imports
# -------
[[ -f $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion
[[ -s ~/.bashrc ]] && source ~/.bashrc
[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases
