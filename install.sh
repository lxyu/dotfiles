#!/bin/bash

# remove existing files
cd ~ || exit 1
echo "Removing existing dot files ..."
rm -rvf ~/.dotfiles
rm -vf .bash_aliases .bashrc .profile .tmux.conf .rtorrent.rc .inputrc .htoprc .gitconfig .irssi

echo "Cloning new dot files ..."
/usr/bin/env git clone git://github.com/lxyu/dotfiles.git ~/.dotfiles || exit 1

# link to dotfiles
echo "Installing dot files ..."
ln -vs .dotfiles/.irssi ~/.irssi
ln -vs .dotfiles/.bash_aliases ~/.bash_aliases
ln -vs .dotfiles/.bashrc ~/.bashrc
ln -vs .dotfiles/.gitconfig ~/.gitconfig
ln -vs .dotfiles/.htoprc ~/.htoprc
ln -vs .dotfiles/.inputrc ~/.inputrc
ln -vs .dotfiles/.profile ~/.profile
ln -vs .dotfiles/.rtorrent.rc ~/.rtorrent.rc
ln -vs .dotfiles/.tmux.conf ~/.tmux.conf
