### Shell setup (macOS)

```
brew install fnm zoxide fzf ripgrep bat pyenv

ln -sf "$PWD/zshrc/mac/.zshrc"    ~/.zshrc
ln -sf "$PWD/zshrc/mac/.zprofile" ~/.zprofile
ln -sf "$PWD/zshrc/mac/.zlogin"   ~/.zlogin
```

Startup is ~0.1s. Tools that aren't installed are skipped. Measure with:

```
for i in 1 2 3; do /usr/bin/time -p zsh -l -i -c exit 2>&1 | grep real; done
```

Notes:
- Static init scripts (zoxide, fzf) are cached in `~/.cache/zsh-init/`, keyed by binary path, so `brew upgrade` regenerates them.
- After `pip install`-ing a CLI under pyenv, run `pyenv rehash`.
- rvm loads lazily on first `rvm` call; the default ruby is on PATH without it.

### Installing ZSH Plugins

```
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Installing Powerlevel10k theme

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

#### Show full branch name in Powerlevel10k - https://github.com/romkatv/powerlevel10k/issues/419

### Install [FiraCode Retina Font](https://github.com/tonsky/FiraCode)

```
brew install --cask font-fira-code
```
