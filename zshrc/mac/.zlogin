# rvm loads lazily on first `rvm` call (saves ~240ms); default ruby + gems come from rvm's static env file
if [[ -d "$HOME/.rvm" ]]; then
  [[ -s "$HOME/.rvm/environments/default" ]] && source "$HOME/.rvm/environments/default"
  rvm() { unset -f rvm; source "$HOME/.rvm/scripts/rvm"; rvm "$@"; }
fi
