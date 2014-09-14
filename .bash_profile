export PATH=$HOME/my-bash/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PS1="\w $ "
export TERM=xterm-256color
export LSCOLORS=ExFxBxDxCxegedabagacad

source ~/my-bash/.aliases
