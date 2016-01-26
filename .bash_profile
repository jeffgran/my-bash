export PATH=$HOME/my-bash/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source $HOME/my-bash/.bash_colors
export JAVA_TOOL_OPTIONS='-Xmx4G'

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

source ~/my-bash/.aliases




# history stuff
HISTSIZE=2222
HISTFILESIZE=999999
HISTTIMEFORMAT="%Y%m%d-%T "
HISTIGNORE="&:pwd:ls:[bf]g:exit:[ \t]*"
shopt -s cmdhist
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
function hs {
    grep $1 $HISTFILE
}

# for the git_ps1 prompt thing below
if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

# prompt with ruby version
# rbenv version | sed -e 's/ .*//'
__rbenv_ps1 ()
{
    rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
    printf $rbenv_ruby_version
}

#export PATH=$PATH:$HOME/.cabal/bin:$HOME/.bash
#export PS1="\w $ "
export PS1="\h| \[\033[0;32m\](\$(__rbenv_ps1))\[\033[0m\] "'$(__git_ps1 "\[\033[0;36m\][%s]\[\033[0m\]")'" \w/$ "


# helps with building stuff using cairo
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig

export DATABASE_URL=postgres:///$(whoami)

# set default docker-machine
eval "$(docker-machine env default)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
