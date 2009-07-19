[ -z "$PS1" ] && return
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#--------------------------------------------------------------------------#
# Variables
#--------------------------------------------------------------------------#
export EDITOR='/usr/bin/vim'
export HISTCONTROL='ignoredups'
export NNTPSERVER='news.nl.linux.org'
#export PKG_CONFIG_PATH='/usr/lib/pkgconfig/'
#export PYTHONPATH='/usr/local/lib/python2.5/site-packages/'
export PS1='[\!][\@]\$ '
export PS2='-> '

#--------------------------------------------------------------------------#
# Colors
#--------------------------------------------------------------------------#
eval "`dircolors -b`"
#export LS_COLORS='no=00:fi=00:di=00;36:ln=00;36:pi=40;33:so=00;35:bd=40;33;
#01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;
#32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;
#31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;
#31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;
#31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;
#35:*.png=00;35:*.tif=00;35:'

#--------------------------------------------------------------------------#
# Pagers
#--------------------------------------------------------------------------#
if [ -e /usr/bin/less ]; then
	export LESS_TERMCAP_mb=$'\E[00;36m'
	export LESS_TERMCAP_md=$'\E[00;36m'
	export LESS_TERMCAP_me=$'\E[0m'
	export LESS_TERMCAP_se=$'\E[0m'
	export LESS_TERMCAP_so=$'\E[01;30m'
	export LESS_TERMCAP_ue=$'\E[0m'
	export LESS_TERMCAP_us=$'\E[00;32m'
	export LESS="-r"
	export PAGER='less'
	alias more='less'
else
	export PAGER='more'
	alias less='more'
fi

#--------------------------------------------------------------------------#
# Aliases
#--------------------------------------------------------------------------#
alias ls='ls --color=auto'
alias ..="cd .."
alias bc='bc -l -q'
alias c='clear'
alias cls='clear'
alias cp='cp -f'
alias date='date +"[ %A ][ %B %d, %Y ][ %r ]"'
alias gdb='gdb --quiet'
alias h='history'
alias l='ls'
alias ll='ls -l'
alias la='ls -A'
alias ma='make clean;./configure;make;make install'
alias mc='make clean'
alias m='make'
alias mv='mv -f'
alias p='ipython'
alias pa='ps aux'
alias quit='exit'
alias rm='rm -f'
alias ssh='ssh -X'
alias vi='vim'

#--------------------------------------------------------------------------#
# Debian Package Control
#--------------------------------------------------------------------------#
alias apt-find='apt-cache search'
alias apt-info='apt-cache showpkg'
alias apt-source='apt-get source'
alias apt-install='sudo apt-get install'
alias apt-update='sudo apt-get update'
alias apt-upgrade='sudo apt-get upgrade'
# Include local functions
if [ -f ~/.functions ]; then
	. ~/.functions
fi

