# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# GITPOD STUFF

for f in ~/.bashrc.d/*; do source $f; done

# CUSTOM BASHRC STUFF

if [[ -s /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
elif [[ -s /etc/bash_completion ]]; then
  source /etc/bash_completion
fi

if [[ -s ~/.git-completion.bash ]]; then
  source ~/.git-completion.bash
fi

if [[ -s ~/.git-prompt.sh ]]; then
  source ~/.git-prompt.sh
fi

# This fixes vim background colour inside screen
TERM=screen-256color

export EDITOR=vim

function set-title() {
  echo -ne "\033]0;$*\007"
}

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
function build-prompt() {
  export PS1="\[\e[m\]"
  export PS1="$PS1\[\e[33m\][\t]\[\e[m\]" # Display the time in yellow
  export PS1="$PS1\[\e[01;32m\] \u\[\e[m\]" # Display user in bold green
  export PS1="$PS1@"
  export PS1="$PS1\[\e[01;34m\]\h\[\e[m\]" # Display host in bold blue:
  export PS1="$PS1 \[\e[35m\]\w\[\e[m\]" # Display the current path in purple
  export PS1="$PS1\[\e[31m\]$(__git_ps1)\[\e[m\]" # Display git details in red
  export PS1="$PS1\n"
  if [[ $(jobs -p | wc -l) -gt 0 ]]; then
    export PS1="$PS1\[\e[01;36m\]* \[\e[m\]" # Display if we have mail in yellow
  fi
  export PS1="$PS1\[\e[32m\]\\$\[\e[m\] " # New line and display last error code as $
}

PROMPT_COMMAND=build-prompt
