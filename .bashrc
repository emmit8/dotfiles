command_exists () {
        type "$1" &> /dev/null ;
}

# HOME  --->
export SCALA_HOME=/usr/local/opt/scala
export JAVA_HOME=$(/usr/libexec/java_home -v '1.8*')

export DOTFILES=~/.dotfiles
# RBENV --->
if command_exists rbenv ; then
    eval "$(rbenv init -)"
fi

# NVM   --->
if command_exists nvm ; then
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
fi

PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:~/.pub-cache/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin:$SCALA_HOME/bin # Add RVM to PATH for scripting

# Mignight Commander viewer and sys editor
export EDITOR=vi

