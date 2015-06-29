source ~/.bashrc

function pget() { pip install git+"$@"; }

parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u(\w)|\033[32m\]\$(parse_git_branch)\[\033[00m\]|$ "
export PS2=""

# Set editor
EDITOR='nano'
VISUAL=$EDITOR
export EDITOR VISUAL

# lein stuff
LEIN_REPL_HOST='127.0.0.1'
LEIN_REPL_PORT=8080
export LEIN_REPL_HOST LEIN_REPL_PORT

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
