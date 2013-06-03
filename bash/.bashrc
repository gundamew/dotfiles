function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/'
}
PS1='${debian_chroot:+($debian_chroot)}[\[\033[1;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\]]\$\[\033[1;36m\]$(parse_git_branch)\[\033[00m\] '
