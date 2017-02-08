# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# bash_completion
[ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion

# bash_prompt
[ -f ~/.bash-powerline.sh ] && source ~/.bash-powerline.sh

# alias
alias ..='cd ..'
alias ls='ls -G'
alias ll='ls -hl'
alias la='ll -A'
alias rm='rm -i'
alias cat='cat -n'
alias grep='grep --color=auto'

alias sshptt='ssh ptt.cc -l bbsu'
alias random='curl -X GET -H "Cache-Control: no-cache" "https://www.random.org/strings/?num=10&len=10&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new"'

# export
export PATH=/usr/local/mysql/bin:/usr/local/sbin:/usr/local/bin:$PATH

export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoreboth
export HISTFILE='/dev/null'

export LANG='zh_TW.UTF-8'
export LC_ALL='zh_TW.UTF-8'

export EDITOR='vim'
export GIT_EDITOR='vim'

export GREP_COLORS='fn:ln=33:se=37:mt=1;37;41'

export TERM='xterm-256color'
