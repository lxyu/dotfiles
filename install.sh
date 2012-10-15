#!/bin/bash

# remove existing files
echo "Removing existing dot files ..."
rm -rf ~/.dotfiles

echo "Cloning new dot files ..."
/usr/bin/env git clone git://github.com/lxyu/dotfiles.git ~/.dotfiles || exit 1

rm -vf ~/.bash_aliases
rm -vf ~/.bash_prompt
rm -vf ~/.bashrc
rm -vf ~/.gitconfig
rm -vf ~/.htoprc
rm -vf ~/.inputrc
rm -vf ~/.irssi
rm -vf ~/.pip
rm -vf ~/.profile
rm -vf ~/.rtorrent.rc
rm -vf ~/.tmux.conf
rm -vf ~/.virtualenvs

# link to dotfiles
echo "Installing dot files ..."
ln -vs ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -vs ~/.dotfiles/.bash_prompt ~/.bash_prompt
ln -vs ~/.dotfiles/.bashrc ~/.bashrc
ln -vs ~/.dotfiles/.gitconfig ~/.gitconfig
ln -vs ~/.dotfiles/.htoprc ~/.htoprc
ln -vs ~/.dotfiles/.inputrc ~/.inputrc
ln -vs ~/.dotfiles/.irssi ~/.irssi
ln -vs ~/.dotfiles/.pip ~/.pip
ln -vs ~/.dotfiles/.profile ~/.profile
ln -vs ~/.dotfiles/.rtorrent.rc ~/.rtorrent.rc
ln -vs ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -vs ~/.dotfiles/.virtualenvs ~/.virtualenvs
