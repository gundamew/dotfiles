# If not running interactively, don"t do anything
[[ -z "$PS1" ]] && return

# bash_completion
[[ $(type -P brew) ]] && source $(brew --prefix)/etc/bash_completion || source /usr/share/bash-completion/bash_completion

# bash_prompt
[[ -f "$HOME/.bash-powerline.sh" ]] && source "$HOME/.bash-powerline.sh"

# Set $PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="$PATH:./vendor/bin:$HOME/.composer/vendor/bin:node_modules/.bin"

# Env for Golang
if [[ -d /usr/local/go ]]; then
    export GOPATH="$HOME/workspace/golang"
    export GOBIN="$GOPATH/bin"
    export PATH="/usr/local/go/bin:$GOBIN:$PATH"
fi

# The next line updates PATH for the Google Cloud SDK.
[[ -f /usr/local/google-cloud-sdk/path.bash.inc ]] && source /usr/local/google-cloud-sdk/path.bash.inc

# The next line enables shell command completion for gcloud.
[[ -f /usr/local/google-cloud-sdk/completion.bash.inc ]] && source /usr/local/google-cloud-sdk/completion.bash.inc

# Include some aliases and exports by OS
[[ $(uname -s) = "Darwin" ]] && source "$HOME/dotfiles/bashrc.macos" || source "$HOME/dotfiles/bashrc.linux"

# Add an error notification for Git
# Ref: https://stackoverflow.com/a/35904417
git() {
    command git "$@"
    local exit_code="$?"
    if [[ "$exit_code" -ne 0 ]]; then
        printf "\n"
        printf "\033[1;31mERROR: git exited with code $exit_code\033[0m\n"
        printf "\n"
        return "$exit_code"
    fi
}

# Ensure to use WP-CLI files within the same scope
wp() {
    if [[ -x ./vendor/bin/wp ]]; then
        ./vendor/bin/wp "$@"
    else
        command wp "$@"
    fi
}

# Common aliases
alias ..="cd .."
alias ll="ls -hl"
alias la="ll -A"
alias rm="rm -i"
alias cat="cat -n"
alias grep="grep --color=auto"

alias phpunit="phpunit --color"

alias sshptt="ssh ptt.cc -l bbsu"
alias random="curl -X GET -H 'Cache-Control: no-cache' 'https://www.random.org/strings/?num=10&len=10&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new'"

alias shrug="echo '¯\_(ツ)_/¯' | pbcopy";
alias fight="echo '(ง'̀-'́)ง' | pbcopy";

# Common exports
export HISTTIMEFORMAT="%F %T "
export HISTCONTROL=ignoreboth
export HISTFILE="/dev/null"

export LANG="zh_TW.UTF-8"
export LC_ALL="zh_TW.UTF-8"

export EDITOR="vim"
export GIT_EDITOR="vim"

export TERM="xterm-256color"
