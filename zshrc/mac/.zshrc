# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Drop duplicate path/fpath entries (duplicates force a completion-cache rebuild on every start)
typeset -U path fpath

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions macos)

DEFAULT_USER="kashish.grover"

export REACT_EDITOR=code
export EDITOR="code --wait"
export VISUAL="code --wait"

fpath+=~/.zfunc
ZSH_DISABLE_COMPFIX=true  # skip compaudit (~10ms); single-user machine
source $ZSH/oh-my-zsh.sh

# Long history (omz defaults: 50k/10k)
HISTSIZE=1000000
SAVEHIST=1000000

# Cache static init scripts per tool binary; an upgrade changes the resolved path, so it regenerates.
_cached_init() {
  (( $+commands[$1] )) || return
  local f=~/.cache/zsh-init/${${commands[$1]:A}//\//_}.zsh
  [[ -s $f ]] || { mkdir -p ${f:h}; "$@" >| $f; }
  source $f
}
_cached_init zoxide init zsh --cmd z   # `z` / `zi`
_cached_init fzf --zsh                 # Ctrl-T, Ctrl-R, Alt-C, ** completion
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'

# Personal Aliases
alias cls="clear"
alias clear-derived-data="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias python="python3"
alias deep-link="xcrun simctl openurl booted"
alias fsearch="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias serveit="python -m http.server 8000"
alias yt-dlp="~/Downloads/yt-dlp_macos -f 'bestvideo[height<=480][ext=mp4]+bestaudio[ext=m4a]' --merge-output-format mp4"
alias gprod="git pull origin develop --rebase"
# omz update skips cloned themes/plugins in $ZSH_CUSTOM; this updates both
alias omz-up='omz update && for d in $ZSH_CUSTOM/{themes,plugins}/*/.git(N:h); do git -C $d pull -q --ff-only && echo "updated ${d:t}"; done'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fnm: Node versions, auto-switches on cd via .nvmrc/.node-version (output is per-shell, can't be cached)
(( $+commands[fnm] )) && eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

[ -f ~/.inshellisense/key-bindings.zsh ] && source ~/.inshellisense/key-bindings.zsh

# pyenv: static equivalent of `pyenv init - --no-rehash zsh` (saves ~90ms).
# Run `pyenv rehash` after installing a CLI via pip.
if (( $+commands[pyenv] )); then
  export PYENV_ROOT="$HOME/.pyenv" PYENV_SHELL=zsh
  path=($PYENV_ROOT/shims $path)
  source "${HOMEBREW_PREFIX:-/opt/homebrew}/opt/pyenv/completions/pyenv.zsh"
  pyenv() {
    local command=${1:-}
    [ "$#" -gt 0 ] && shift
    case "$command" in
    rehash|shell) eval "$(pyenv "sh-$command" "$@")" ;;
    *) command pyenv "$command" "$@" ;;
    esac
  }
fi

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.opencode/bin:$PATH"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

export DO_NOT_TRACK=true
export GH_TELEMETRY=false

zstyle ':completion:*' menu select

# Trust keychain CAs (incl. corporate TLS-inspection roots) in AWS/Node/Python/Deno.
# Rebuilt at most once a day.
_certs=($HOME/.custom-certs.pem(N.mh-24))
(( $#_certs )) || security find-certificate -a -p /System/Library/Keychains/SystemRootCertificates.keychain /Library/Keychains/System.keychain > "$HOME/.custom-certs.pem"
unset _certs
export {AWS_CA_BUNDLE,NODE_EXTRA_CA_CERTS,REQUESTS_CA_BUNDLE,SSL_CERT_FILE}="$HOME/.custom-certs.pem"
export DENO_TLS_CA_STORE='system'
