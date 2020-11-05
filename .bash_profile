DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"
SYMDIR="$(cd $(dirname "$(readlink "${BASH_SOURCE[0]}")") && pwd)"

export PATH=$HOME/.cargo/bin:$DIR/bin:$HOME/.yarn-global/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export JAVA_TOOL_OPTIONS='-Xmx4G'

export TERM=ansi
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

source $SYMDIR/.bash_colors
source $SYMDIR/.aliases




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
if [ -f /usr/local/share/gitprompt.sh ]; then
    # GIT_PROMPT_THEME=Default

    # Set config variables first
    GIT_PROMPT_ONLY_IN_REPO=0

    GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

    # GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
    GIT_PROMPT_SHOW_UNTRACKED_FILES=no # can be no, normal or all; determines counting of untracked files

    # GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

    # GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
    # GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

    # as last entry source the gitprompt script
    # GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh
    # GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
    # GIT_PROMPT_THEME=Default

    Time12a="\$(date +%H:%M)"
    PathShort="\w"
    GIT_PROMPT_START_USER="${Yellow}${PathShort}${White} (${Red}\$(__rbenv_ps1)${White})"
    #GIT_PROMPT_END_USER="${GIT_PROMPT_END} ${White}${ResetColor} ${PathShort} $ "
    # GIT_PROMPT_END="${GIT_PROMPT_END} ${White}${ResetColor} ${PathShort} $ "

    . /usr/local/share/gitprompt.sh
fi


# prompt with ruby version
# rbenv version | sed -e 's/ .*//'
__rbenv_ps1 ()
{
    rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
    printf $rbenv_ruby_version
}


# OLD custom bash prompt, keeping for posterity
#export PS1="\w $ "
#export PS1="\h| \[\033[0;32m\](\$(__rbenv_ps1))\[\033[0m\] "'$(__git_ps1 "\[\033[0;36m\][%s]\[\033[0m\]")'" \w/$ "
#export PS1="\h| \[\033[0;32m\](\$(__rbenv_ps1))\[\033[0m\] \w/$ "


# helps with building stuff using cairo
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

### Added by the Heroku Toolbelt

export PATH="/usr/local/heroku/bin:$PATH"
[ -e $DIR/.letoterc ] && source $DIR/.letoterc

export SOURCEKIT_TOOLCHAIN_PATH=/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2018-11-01-a.xctoolchain/
