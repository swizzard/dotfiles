# Give up completely if no BASH_VERSINFO (<2.0)
if [ -z "$BASH_VERSINFO" ]; then
    printf \
        '%s: %s is too old to work with this configuration.\n' \
        "${BASH##*/}" "$BASH_VERSION" >&2
    return
fi

# Don't do anything if not running interactively
if [[ $- != *i* ]]; then
    return
fi

# Keep plenty of history; unlimited, if we have >=4.3
if ((${BASH_VERSINFO[0]} >= 4 \
&& 10#${BASH_VERSINFO[1]%%[![:digit:]]*} >= 3)); then
    HISTFILESIZE=-1
    HISTSIZE=-1
else
    HISTFILESIZE=1000000
    HISTSIZE=1000000
fi

# Ignore duplicate commands and whitespace in history
HISTCONTROL=ignoreboth

# Keep the times of the commands in history
HISTTIMEFORMAT='%F %T  '

# Turn off flow control and control character echo
stty -ixon -ctlecho 2>/dev/null

# Autocorrect fudged paths in cd calls
shopt -s cdspell
# Update the hash table properly
shopt -s checkhash
# Update columns and rows if window size changes
shopt -s checkwinsize
# Put multi-line commands onto one line of history
shopt -s cmdhist
# Include dotfiles in pattern matching
shopt -s dotglob
# Enable advanced pattern matching
shopt -s extglob
# Append rather than overwrite Bash history
shopt -s histappend
# Don't use Bash's builtin host completion
shopt -u hostcomplete
# Don't warn me about new mail all the time
shopt -u mailwarn
# Ignore me if I try to complete an empty line
shopt -s no_empty_cmd_completion
# Use programmable completion, if available
shopt -s progcomp
# Warn me if I try to shift when there's nothing there
shopt -s shift_verbose
# Don't use PATH to find files to source
shopt -u sourcepath

unset -v config

### Added by the Heroku Toolbelt
if [[ -a /usr/local/heroku/bin ]];
  then export PATH="/usr/local/heroku/bin:$PATH";
fi

function fuck() {
  killall -9 $2;
  if [ $? == 0 ]
  then
    echo
    echo " (╯°□°）╯︵$(echo $2|flip &2>/dev/null)"
    echo
  fi
}

parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [[ -a /Applications ]]; then
  function chrome() {
    open /Applications/Google\ Chrome.app --new-tab-page-1 $1 &
  };
fi

if which tmux 2>&1 >/dev/null && [ -t 1 ]; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux attach || tmux new-session)
fi
export GOPATH=~/go-stuff
export PATH=$PATH:$GOPATH/bin

set -o vi
