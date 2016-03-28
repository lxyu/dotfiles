#!/bin/bash

# remove existing files
echo "Cloning new dot files ..."
/usr/bin/env git clone git://github.com/lxyu/dotfiles.git ~/.dotfiles || exit 1

echo "Linking..."
files=(
    # files
    .Xmodmap \
    .Xresources \
    .aria2 \
    .bash_aliases \
    .bash_prompt \
    .bashrc \
    .gitconfig \
    .htoprc \
    .i3blocks.conf \
    .i3status.conf \
    .ideavimrc \
    .inputrc \
    .pentadactylrc \
    .profile \
    .rtorrent.rc \
    .stylish-haskell.yaml \
    .tmux-osx.conf \
    .tmux-powerlinerc \
    .tmux.conf \
    .xbindkeysrc \
    .xinitrc \
    .zprofile \
    .zshrc \

    # dirs
    .i3 \
    .irssi \
    .pentadactyl \
    .tmux-themes \
    .pip \
    .virtualenvs \
    .zsh
)

for f in $files ; do
    ln -vsfn ~/.dotfiles/$f ~/$f
done
