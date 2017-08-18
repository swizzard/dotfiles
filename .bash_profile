source ~/.bashrc

function pget() { pip install git+"$@"; }

parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\w|\033[32m\]\$(parse_git_branch)\[\033[00m\]|$ "
export PS2=""

# Set editor
EDITOR='vim'
VISUAL=$EDITOR
export EDITOR VISUAL

# lein stuff
# LEIN_REPL_HOST='127.0.0.1'
# LEIN_REPL_PORT=8080
# export LEIN_REPL_HOST LEIN_REPL_PORT

# Browser
if [ -n "$DISPLAY" ]; then
    BROWSER='chrome'
else
    BROWSER='lynx'
fi
export BROWSER

# Set pager
PAGER='less'
export PAGER

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

function countf() { ls -1 | wc; }

function wcls() {
  for i in $( ls $1 );
   do wc $i;
 done;
  countf;
}

function dmerge() { cp -R $1/* $2/; }
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/samuelraker/.local/bin:$PATH"
# eval $(gpg-agent --daemon --enable-ssh-support "${HOME}/.gpg-agent-info")

function pscs() { if [ -z "$1"];
                  then
                    D=$(pwd)
                  else
                    D=$1
                  fi
                  echo "$D"
                  /usr/local/bin/psc-ide-server --port=4244 --directory=$D&
                };

# virtualenvwrapper
export WORKON_HOME=$HOME/Envs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
else
  echo "WARNING: Can't find virtualenvwrapper.sh"
fi

alias bu='brew update && brew upgrade && brew cleanup'

export PATH="$HOME/.cargo/bin:$PATH"
