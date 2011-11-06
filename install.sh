#!/bin/bash

cd ~ || exit 1
git clone git://github.com/lxyu/dotfiles.git || exit 1

ln -s dotfiles/.irssi
ln -s dotfiles/.bash_aliases
ln -s dotfiles/.bashrc
ln -s dotfiles/.gitconfig
ln -s dotfiles/.htoprc
ln -s dotfiles/.inputrc
ln -s dotfiles/.profile
ln -s dotfiles/.rtorrent.rc
ln -s dotfiles/.tmux.conf
