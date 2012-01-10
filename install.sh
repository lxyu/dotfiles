#!/bin/bash

# remove existing files
cd ~ || exit 1
rm -r ~/dotfiles
rm -f .bash_aliases .bashrc .profile .tmux.conf .rtorrent.rc .inputrc .htoprc .gitconfig .irssi

git clone git://github.com/lxyu/dotfiles.git || exit 1

# link to dotfiles
ln -s dotfiles/.irssi
ln -s dotfiles/.bash_aliases
ln -s dotfiles/.bashrc
ln -s dotfiles/.gitconfig
ln -s dotfiles/.htoprc
ln -s dotfiles/.inputrc
ln -s dotfiles/.profile
ln -s dotfiles/.rtorrent.rc
ln -s dotfiles/.tmux.conf

sudo mkdir -p /root
sudo rm -f /root/.bash_aliases /root/.bashrc /root/.profile /root/.tmux.conf /root/.vim /root/.vimrc
sudo ln -s ~/.bashrc /root/.bashrc
sudo ln -s ~/.bash_aliases /root/.bash_aliases
sudo ln -s ~/.profile /root/.profile
sudo ln -s ~/.tmux.conf /root/.tmux.conf
sudo ln -s ~/.vim /root/.vim
sudo ln -s ~/.vimrc /root/.vimrc
