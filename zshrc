#######################################
# ZSH configuration
#######################################
export ZSH=$HOME/.oh-my-zsh

# Disables homebrew's urge to auto-update itself each time its invoked.
export HOMEBREW_NO_AUTO_UPDATE=1

# Set zsh theme to af-magic only if the current terminal is not WarpTerminal
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes for more themes
if [ "$TERM_PROGRAM" != "WarpTerminal" ]; then
  ZSH_THEME="af-magic"
fi

export LC_ALL=en_US.UTF-8

# Make completion case-insensitive.
CASE_SENSITIVE="false"

# Make compleation ignore hyphens.
HYPHEN_INSENSITIVE="true"

# Shows dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Don't show untracked files as dirty git repo.
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
plugins=(
  git
  docker docker-compose
  kubectl
  python
  fzf
  npm
  autojump
  aws
  # zsh-syntax-highlighting
)

# ohmyzsh!
source $ZSH/oh-my-zsh.sh

# Don't share history between open terminals.
unsetopt share_history

# Don't append history to file until the shell exits.
setopt inc_append_history

# Don't cd automatically if the command is a directory.
unsetopt autocd


####################################### 
# Functions
#######################################
# fzf to find and edit files.
vf() {
  local files

  files=(${(f)"$(fd --hidden | fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500')"})

  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}

# Create a 7z archive and open finder with it selected.
z()
{
    if [ $# = 0 ]; then
        echo "Usage: z filename"
        return
    fi


    if [ $# = 1 ]; then
        filename=$(basename -- "$1")
        filename_no_ext="${filename%.*}"
        archive_name="$filename_no_ext.7z"
    else
        archive_name="$(basename $(dirname $(pwd))).7z"
    fi

    7z a $archive_name $@
    osascript -e "tell application \"Finder\"" -e activate -e "reveal POSIX file \"$(realpath $archive_name)\"" -e end tell
}

# Cool git diff with fzf.
gitdifffzf() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}
alias gd=gitdifffzf


#######################################
# Aliases
#######################################
alias 7z=7zz
alias vs=code
alias android_studio='function _f(){ /Applications/Android\ Studio.app/Contents/MacOS/studio $(realpath $@) };_f'
alias clion='function _f(){ /Applications/Clion.app/Contents/MacOS/clion $(realpath $@)& };_f'
alias fd='fd --no-ignore-vcs'
alias copy=clipcopy
alias cat='bat --paging never --style plain'
alias qr='qrencode -o - -t ansi'
alias tmp='cd $(mktemp -d)'


#######################################
# Environment Variables
#######################################
export ANDROID_HOME="$HOME/Library/Android"
export ANDROID_NDK_HOME="/opt/android-ndk-r15c"
export ANDROID_NDK_ROOT="/opt/android-ndk-r15c"
export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/openjdk-20.0.1/Contents/Home/"

# FZF settings.
export FZF_DEFAULT_COMMAND='fd --type f --no-ignore-vcs'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable GCC colors with default colors.
export GCC_COLORS=" "

export PATH="/Applications/Hopper Disassembler v4.app/Contents/MacOS:$PATH"
export PATH="$HOME/Library/Java/JavaVirtualMachines/openjdk-20.0.1/Contents/Home/bin:$PATH"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"

# Enable iTerm2 shell integration.
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
