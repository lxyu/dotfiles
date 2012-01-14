#!/bin/bash

# remove existing files
cd ~ || exit 1
echo "Removing existing dot files ..."
rm -rf ~/dotfiles
rm -vf .bash_aliases .bashrc .profile .tmux.conf .rtorrent.rc .inputrc .htoprc .gitconfig .irssi

echo "Cloning new dot files ..."
git clone git://github.com/lxyu/dotfiles.git || exit 1

# link to dotfiles
echo "Installing dot files ..."
ln -vs dotfiles/.irssi
ln -vs dotfiles/.bash_aliases
ln -vs dotfiles/.bashrc
ln -vs dotfiles/.gitconfig
ln -vs dotfiles/.htoprc
ln -vs dotfiles/.inputrc
ln -vs dotfiles/.profile
ln -vs dotfiles/.rtorrent.rc
ln -vs dotfiles/.tmux.conf

read -p "Do you want to link dot files for root?\n" choice
case "$choice" in
    y|Y ) continue;;
    * ) exit;;
esac

echo "Linking dot files for root ..."
if [ $(uname) == 'Darwin' ]; then
    ROOT_HOME='/var/root'
else
    ROOT_HOME='/root'
fi

sudo mkdir -p $ROOT_HOME
cd $ROOT_HOME || exit 1
sudo rm -vrf .bash_aliases .bash_history .bashrc .profile .tmux.conf .vim .vimrc
sudo ln -vs ~/.profile
sudo ln -vs ~/.bashrc
sudo ln -vs ~/.bash_aliases
sudo ln -vs ~/.bash_history
sudo ln -vs ~/.tmux.conf
sudo ln -vs ~/.vim
sudo ln -vs ~/.vimrc
