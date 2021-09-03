# Path to your oh-my-zsh installation.
export ZSH=/Users/kashish.grover/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# ZSH Plugins
plugins=(
  git
  z 
  zsh-syntax-highlighting 
  zsh-autosuggestions
  osx
)

# ZSH Customizations

# User configuration
DEFAULT_USER="kashish.grover"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# android studio tools & sdk
export PATH="$HOME/.npm/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/font-tools/FontCommandLineTools.pkg
export REACT_EDITOR=code

source $ZSH/oh-my-zsh.sh

# Personal Aliases
alias cls="clear"
alias rnios="react-native run-ios"
alias rnand="react-native run-android"
alias avd-list="${ANDROID_HOME}/emulator/emulator -list-avds"
alias avd-pixel="${ANDROID_HOME}/emulator/emulator @Pixel_3a_API_28"
alias clear-derived-data="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias adb-reverse="adb reverse tcp:8081 tcp:8081 && adb reverse tcp:9090 tcp:9090"

# Startup scripts
adb reverse tcp:8081 tcp:8081
clear && fortune | cowsay | lolcat && echo
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
