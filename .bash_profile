DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"
SYMDIR="$(cd $(dirname "$(readlink "${BASH_SOURCE[0]}")") && pwd)"

if which mise > /dev/null; then eval "$(mise activate bash)"; fi

export PATH=$SYMDIR/bin:$PATH
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export TERM=ansi
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
#export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
export LANG=en_US.UTF-8

source $SYMDIR/.bash_colors
source $SYMDIR/.aliases


ulimit -n 8192

# darwin
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# linux
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bash completion (brew install bash-completion)
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# history stuff
export HISTSIZE=2222
export HISTFILESIZE=999999
export HISTTIMEFORMAT="%Y%m%d-%T "
export HISTIGNORE="&:pwd:ls:[bf]g:exit:[ ]*"
export HISTCONTROL=ignoreboth
shopt -s cmdhist
shopt -s histappend

# If there are multiple matches for completion, Tab should cycle through them
#bind 'TAB':menu-complete

# Display a list of the matching files
#bind "set show-all-if-ambiguous on"

# Perform partial completion on the first Tab press,
# only start cycling full results on the second Tab press
#bind "set menu-complete-display-prefix on"


# export PROMPT_COMMAND='history -a; history -c; history -r;'"$PROMPT_COMMAND"
function hs {
    grep $1 $HISTFILE
}

export BASH_SILENCE_DEPRECATION_WARNING=1

# for the git_ps1 prompt thing below
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share

    GIT_PROMPT_ONLY_IN_REPO=0

    GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

    GIT_PROMPT_SHOW_UNTRACKED_FILES=no # can be no, normal or all; determines counting of untracked files

    Time12a="\$(date +%H:%M)"
    PathShort="\w"
    GIT_PROMPT_START_USER="${Yellow}${PathShort}${White} ${IBlack}(\$(__mise_ps1)${IBlack})${Color_Off}"

    source "$HOME/.bash-git-prompt/gitprompt.sh"
fi


__mise_ps1() {
    # Theme colors
    local COLOR_RESET="${Color_Off}"
    local COLOR_DEFAULT="${IBlack}"   # grey

    local Black='\e[0;30m'        # Black
    local Red='\e[0;31m'          # Red
    local Green='\e[0;32m'        # Green
    local Yellow='\e[0;33m'       # Yellow
    local Blue='\e[0;34m'         # Blue
    local Purple='\e[0;35m'       # Purple
    local Cyan='\e[0;36m'         # Cyan
    local White='\e[0;37m'        # White

    declare -A TOOL_COLORS=(
        [python]="${Purple}"
        [ruby]="${Red}"
        [node]="${Green}"
    )

    # Build the raw string (tool@version or ✖)
    local raw
    raw=$(mise ls --json | jq -r '
    to_entries
    | map(select(.value | any(has("source"))))
    | map(
        .key + "@" +
        ( [ .value[] | select(.active) | .version ] | first // "✖")
      )
    | join("|")
  ')

    local out=""
    local IFS="|"
    for item in $raw; do
        local tool="${item%@*}"
        local version="${item#*@}"
        local color="${TOOL_COLORS[$tool]:-$COLOR_DEFAULT}"
        out+="${color}${tool}@${version}${COLOR_RESET}${IBlack} | "
    done

    # Trim trailing " | "

    printf "${out% | }"
}


export PATH="$HOME/.local/share/mise/shims:/opt/homebrew/bin:$HOME/.local/bin:$HOME/.tfenv/bin:$HOME/go/bin:$PATH"

# homebrew path setup
[ -e /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

[ -e $SYMDIR/.doxrc.sh ] && source $SYMDIR/.doxrc.sh

[ -e $SYMDIR/.finorc.sh ] && source $SYMDIR/.finorc.sh
# [Certiv Scout CA merge v2]
[ -r "/Library/Application Support/ai.certiv.scout/ca-merge.sh" ] && . "/Library/Application Support/ai.certiv.scout/ca-merge.sh"
# [/Certiv Scout CA merge v2]
