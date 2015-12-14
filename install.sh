#!/bin/bash

# remove existing files
echo "Removing existing dot files ..."
rm -rf ~/.dotfiles
rm -rf ~/.autoenv

echo "Cloning new dot files ..."
/usr/bin/env git clone git://github.com/lxyu/dotfiles.git ~/.dotfiles || exit 1

# remove old existing files
rm -vf ~/.bash_aliases
rm -vf ~/.bash_prompt
rm -vf ~/.bashrc
rm -vf ~/.gitconfig
rm -vf ~/.htoprc
rm -vf ~/.inputrc
rm -vf ~/.profile
rm -vf ~/.rtorrent.rc
rm -vf ~/.tmux.conf
rm -vrf ~/.irssi
rm -vrf ~/.pip
rm -vrf ~/.tmux-powerlinerc
rm -vrf ~/.virtualenvs

rm -vf ~/.i3blocks.conf
rm -vf ~/.i3status.conf
rm -vf ~/.ideavimrc
rm -vf ~/.xbindkeysrc
rm -vf ~/.xinitrc
rm -vrf ~/.i3/
rm -vrf ~/.pentadactyl/

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
ln -vs ~/.dotfiles/.tmux-osx.conf ~/.tmux-osx.conf
ln -vs ~/.dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc
ln -vs ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -vs ~/.dotfiles/.virtualenvs ~/.virtualenvs
ln -vs ~/.dotfiles/.i3blocks.conf ~/.i3blocks.conf
ln -vs ~/.dotfiles/.i3status.conf ~/.i3status.conf
ln -vs ~/.dotfiles/.ideavimrc ~/.ideavimrc
ln -vs ~/.dotfiles/.xbindkeysrc ~/.xbindkeysrc
ln -vs ~/.dotfiles/.xinitrc ~/.xinitrc
ln -vs ~/.dotfiles/.i3 ~/.i3
ln -vs ~/.dotfiles/.pentadactyl/.pentadactylrc ~/.pentadactylrc

cd ~/.dotfiles/ && git submodule update --init
