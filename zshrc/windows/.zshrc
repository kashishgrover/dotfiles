export ZSH="/root/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# ZSH Plugins
plugins=(
  git
  z 
  zsh-syntax-highlighting 
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Personal Aliases
alias cls="clear"
alias rnios="react-native run-ios"
alias rnand="react-native run-android"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Startup scripts
clear && fortune | cowsay | lolcat && echo
