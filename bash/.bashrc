# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# Modified by Hart Russell April 24, 2015

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
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -AF'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias la='ls -AlF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

alias fuck='sudo $(fc -nl -1)'
alias ssh='ssh -i ~/.ssh/devuser'
alias scp='scp -i ~/.ssh/devuser'
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1

# Add ability to go back many directories with only ellipses
alias ..="cd .."
alias ...="cd ../.."

# Stuff below adapted from: http://serverfault.com/questions/3743/what-useful-things-can-one-add-to-ones-bashrc

# Combine multiline commands into one in history
shopt -s cmdhist

# Change info/appearance of prompt
function __setprompt {
local BLUE="\[\033[01;31m\]"
local NO_COLOUR="\[\033[0m\]"
local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
if [ $SSH2_IP ] || [ $SSH_IP ] ; then
    local SSH_FLAG="@\h"
fi
PS1="$BLUE[\$(date +%H:%M)][\u$SSH_FLAG:\w]\\$ $NO_COLOUR"
PS2="$BLUE>$NO_COLOUR "
PS4='$BLUE+$NO_COLOUR '
                      }
__setprompt

#Set Mac OSX options
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls="ls -AFG"

    #git autocomplete for osx
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi

#Check for aliases/paths I need for work
if [ -f ~/.bash_work ]; then
    . ~/.bash_work
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source /usr/share/git/completion/git-completion.bash
