#vim mode in the shell
set -o vi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Aliases
alias ls='ls -F --color=auto'    #colors
alias l='ls -F --color=auto'    #colors
alias ll='ls -lsah --color=auto'  #long list
alias la='ls -AF --color=auto'  #show hidden
alias lx='ls -lXB --color=auto'  #sort by sextension
alias lk='ls -lSr --color=auto'  #sort by size biggest last
alias lc='ls -ltcr --color=auto' #sort by and show chagne times
alias lu='ls -ltur --color=auto' #sort by and show access time
alias lt='ls -ltr --color=auto'  #sort by date
alias lm='ls -al |more'          #pipe through more
alias lr='ls -lR'                #recursive
alias tree='tree -Csuh'          #alternative to recursive ls
alias df='df -kTh'
alias path='echo -e ${PATH//:/\\n}'
alias grep='grep --color=auto'

# Silly sudo
alias salt='sudo salt'

# Program defaults
alias bundleupdate='vim -c BundleUpdate -c qa'

# To keep typos alive
alias snv="svn"
alias cim="vim"
alias bim="vim"
alias svim="vim"
alias suod="sudo"
alias sduo="sudo"
alias vm="mv"

if [ -f /usr/bin/fortune ]; then
    command fortune 95% calvin firefly
fi

parse_git_dirty ()
{
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
parse_git_branch ()
{
    git branch 2> /dev/null | grep '*' | sed "s/*\ \(.*\)/$(parse_git_dirty)\1/"
}

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

BLUE="\[\033[0;34m\]"
BLUEBOLD="\[\033[1;34m\]"
GREEN="\[\033[1;32m\]"
RED="\[\033[0;31m\]"
REDBOLD="\[\033[1;31m\]"
WHITE="\[\033[0m\]"
WHITEBOLD="\[\033[1;37m\]"
YELLOW="\[\033[0;33m\]"
YELLOWBOLD="\[\033[1;33m\]"

export PS1=" $GREEN\u@\h $YELLOW\@ $YELLOWBOLD\$(parse_git_branch) $BLUEBOLD\w \n$WHITE\\$ "

# virtualenvwrapper stuff.
export WORKON_HOME=~/Envs
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
export EDITOR=vim
# Things for python virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true

# Kill of my proceses (useful once in a while because disconnects don't kill them)
alias killall='pkill -u zhangb'

# cd aliases
alias ..="cd ..; ls --color=auto"        #go to parent dir
alias ...="cd ../.; ls --color=auto"    #go to grandparent dir
alias ....="cd ../../.; ls --color=auto"    #go to great-grandparent dir
alias .....="cd ../../../.; ls --color=auto"    #go to great-great-grandparent dir

# rc files
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias screenrc="vim ~/.screenrc"
alias refresh="source ~/.bashrc"

# fixe typos
shopt -s cdspell

# better cd
cs ()
{
    cd $1;
    ls -F --color=auto
}

# Nethack
alias nethack="telnet nethack.alt.org"

# start tmux
tmux -2 a

# grep
search () { find . | xargs grep --color=auto "$@"; }
