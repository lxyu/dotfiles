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

read -p "Do you want to link dot files for root?" choice
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
sudo rm -vrf $ROOT_HOME/.bash_aliases $ROOT_HOME/.bashrc $ROOT_HOME/.profile $ROOT_HOME/.tmux.conf
sudo ln -vs ~/.bashrc $ROOT_HOME/.bashrc
sudo ln -vs ~/.bash_aliases $ROOT_HOME/.bash_aliases
sudo ln -vs ~/.profile $ROOT_HOME/.profile
sudo ln -vs ~/.tmux.conf $ROOT_HOME/.tmux.conf
