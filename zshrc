export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="$PATH:./vendor/bin:$HOME/.composer/vendor/bin:node_modules/.bin"

export ZSH="/Users/bxvip/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HIST_STAMPS="%F %T "

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Plugin configuration

ZSH_AUTOSUGGEST_STRATEGY=(
    match_prev_cmd
    history
)

# User configuration

export LANG=en_US.UTF-8

export EDITOR="vim"

export GPG_TTY=$(tty)
