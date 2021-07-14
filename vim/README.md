## Vim Setup

1. Set up Vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

2. Copy .vimrc to ~/.vimrc

3. Build YouCompleteMe
```
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
```

4. Install the plugins:
```
vim
:PluginInstall
```