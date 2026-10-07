# Static copy of `brew shellenv` for Apple Silicon (saves ~70ms per login shell).
# If Homebrew lives elsewhere, replace with: eval "$(brew shellenv)"
export HOMEBREW_PREFIX="/opt/homebrew" HOMEBREW_CELLAR="/opt/homebrew/Cellar" HOMEBREW_REPOSITORY="/opt/homebrew"
fpath[1,0]="/opt/homebrew/share/zsh/site-functions"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"
