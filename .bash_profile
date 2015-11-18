export CLICOLOR=1

# use yellow for directories
# export LSCOLORS=dxfxcxdxbxegedabagacad
# export HISTSIZE=50000
# export HISTFILESIZE=50000
# export HISTFILE="$HOME/.bash_history"

set_prompts() {
    # Simple colors
    local DEFAULT="\[\033[0m\]"   
    local BLACK="\[\033[0;30m\]"
    local RED="\[\033[0;31m\]"
    local GREEN="\[\033[0;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local BLUE="\[\033[0;34m\]"
    local MAGENTA="\[\033[0;35m\]"
    local CYAN="\[\033[0;36m\]"
    local WHITE="\[\033[0;37m\]"

    # Bold colors
    local EM_BLACK="\[\033[1;30m\]"
    local EM_RED="\[\033[1;31m\]"
    local EM_GREEN="\[\033[1;32m\]"
    local EM_YELLOW="\[\033[1;33m\]"
    local EM_BLUE="\[\033[1;34m\]"
    local EM_MAGENTA="\[\033[1;35m\]"
    local EM_CYAN="\[\033[1;36m\]"
    local EM_WHITE="\[\033[1;37m\]"

    # Backgrounds
    local BG_BLACK="\[\033[40m\]"
    local BG_RED="\[\033[41m\]"
    local BG_GREEN="\[\033[42m\]"
    local BG_YELLOW="\[\033[43m\]"
    local BG_BLUE="\[\033[44m\]"
    local BG_MAGENTA="\[\033[45m\]"
    local BG_CYAN="\[\033[46m\]"
    local BG_WHITE="\[\033[47m\]"

    PS1="${EM_RED}\w\n${EM_BLUE}> ${DEFAULT}"
    export PS1
}
set_prompts
unset -f set_prompts

[[ -f $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion
[[ -s ~/.bashrc ]] && source ~/.bashrc
[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases
