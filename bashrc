# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source machine-local definitions
if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

if [ -f /etc/profile.d/bash_completion.sh ]; then
    . /etc/profile.d/bash_completion.sh
fi

# Color prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1
print_right_aligned_time()
{
    printf "%*s" $COLUMNS $(date "+%T")
}
GREY='\[\e[1;30m\]'
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
BLUE='\[\e[1;34m\]'
RESET='\[\e[m\]'
RIGHT_ALIGNED_TIME='\[$(tput sc; print_right_aligned_time; tput rc)\]'

# Change color of prompt based on most recent exit code
prompt_cmd()
{
    if [[ $? != 0 ]]
    then
        export PS1="${GREY}${RIGHT_ALIGNED_TIME}${RESET}${RED}\u${RESET} ${BLUE}\w${RESET}\$(__git_ps1)\n ${GREEN}\$${RESET} "
    else
        export PS1="${GREY}${RIGHT_ALIGNED_TIME}${RESET}${GREEN}\u${RESET} ${BLUE}\w${RESET}\$(__git_ps1)\n ${GREEN}\$${RESET} "
    fi
}
PROMPT_COMMAND=prompt_cmd
export PS1="${GREY}${RIGHT_ALIGNED_TIME}${RESET}${GREEN}\u${RESET} ${BLUE}\w${RESET}\$(__git_ps1)\n ${GREEN}\$${RESET} "


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

# colors
export CLICOLOR=1
ls --color=auto &> /dev/null && alias ls='ls --color=auto'

PERL_MB_OPT="--install_base \"/Users/przemek/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/przemek/perl5"; export PERL_MM_OPT;

# Alias ack-grep if ack is not found
type ack >/dev/null 2>/dev/null || alias ack=ack-grep

export PATH="$HOME/bin:$PATH"

if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -f $HOME/Library/Preferences/org.dystroy.broot/launcher/bash/br ]; then
    source $HOME/Library/Preferences/org.dystroy.broot/launcher/bash/br
fi
