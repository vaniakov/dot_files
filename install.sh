#!/bin/bash

mkdir -p ~/.vim/bundle ~/.tmux/plugins $XDG_CONFIG_HOME/alacritty

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 2>/dev/null
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 2>/dev/null
git clone https://github.com/powerline/powerline ~/.tmux/plugins/powerline 2>/dev/null

if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ] && [ ! -d $HOME/.virtualenvs/nvim ]; then
    mkvirtualenv nvim
    pip install neovim black
    deactivate
fi

opts="-s"
if [ "${1}" = "-f" ]; then
    opts="-sf"
fi

cd ~
ln ${opts} dot_files/.bash_functions .bash_functions
ln ${opts} dot_files/.bash_aliases .bash_aliases
ln ${opts} dot_files/.env_vars .env_vars
ln ${opts} dot_files/.zshrc .zshrc
ln ${opts} dot_files/.gitconfig .gitconfig
ln ${opts} dot_files/.p10k.zsh .p10k.zsh
ln ${opts} dot_files/.tmux.conf .tmux.conf
ln ${opts} dot_files/.vimrc .vimrc
ln ${opts} dot_files/alacritty.yml $XDG_CONFIG_HOME/alacritty/alacritty.yml

# Download Fonts
# MacOS:
# https://github.com/tonsky/FiraCode
# Linux:
# https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf

# Alacrity

#font:
#  normal:
#    family: "MesloLGS NF"
