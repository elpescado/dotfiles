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
eval "$(starship init bash)"

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

export JQ_COLORS="38;5;246:38;5;196:38;5;70:38;5;214:38;5;27::"
