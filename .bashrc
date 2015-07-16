# HOME  --->
export SCALA_HOME=/usr/local/opt/scala
export JAVA_HOME=$(/usr/libexec/java_home -v '1.8*')

# RBENV --->
eval "$(rbenv init -)"

# NVM   --->
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
PATH=$PATH:$HOME/.rvm/bin:$SCALA_HOME/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
