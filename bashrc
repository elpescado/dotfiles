# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source machine-local definitions
if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

export PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] $(__git_ps1)\n \[\e[1;32m\]\$\[\e[m\] '

function coffee_error_handler () {
    if [ `date "+%H"` -lt 10 ]
    then
        echo "Command failed... Did you drink coffee today?"
    fi
}

trap coffee_error_handler ERR


# SECTION: Aliases && functions

# Subversion
function svndiff {
    svn diff $@ --diff-cmd=colordiff -x -uw | less -R
}
alias svn=colorsvn
alias 7up="svn up"

# VIM
alias givm=gvim
export EDITOR=vim

# Misc
export DIFF_TOOL=diff
ls --color=auto &> /dev/null && alias ls='ls --color=auto'
