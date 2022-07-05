mkdir -p ~/.vim/bundle ~/.tmux/plugins

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/powerline/powerline ~/.tmux/plugins/powerline

cd ~
ln -s dot_files/.bash_functions .bash_functions
ln -s dot_files/.bash_aliases .bash_aliases
ln -s dot_files/.env_vars .env_vars
ln -s dot_files/.zshrc .zshrc
ln -s dot_files/.gitconfig .gitconfig
ln -s dot_files/.p10k.zsh .p10k.zsh
ln -s dot_files/.tmux.conf .tmux.conf
ln -s dot_files/.vimrc .vimrc

# Download Font
# https://github.com/tonsky/FiraCode
