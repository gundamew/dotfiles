# Run aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Show git branch
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\(\1\)/'
}

PS1='${debian_chroot:+($debian_chroot)}[\[\033[1;32m\]\u@\h\[\033[00m\]: \[\033[1;34m\]\w\[\033[00m\]\[\033[1;31m\]$(parse_git_branch)\[\033[00m\]]\$ '
#PS1='${debian_chroot:+($debian_chroot)}[\u@\h: \w$(parse_git_branch)]\$ '
