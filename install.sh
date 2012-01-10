#!/bin/bash

# remove existing files
cd ~ || exit 1
echo "Removing existing dot files ..."
rm -r ~/dotfiles
rm -f .bash_aliases .bashrc .profile .tmux.conf .rtorrent.rc .inputrc .htoprc .gitconfig .irssi

echo "Cloning new dot files ..."
git clone git://github.com/lxyu/dotfiles.git || exit 1

# link to dotfiles
echo "Installing dot files ..."
ln -s dotfiles/.irssi
ln -s dotfiles/.bash_aliases
ln -s dotfiles/.bashrc
ln -s dotfiles/.gitconfig
ln -s dotfiles/.htoprc
ln -s dotfiles/.inputrc
ln -s dotfiles/.profile
ln -s dotfiles/.rtorrent.rc
ln -s dotfiles/.tmux.conf

read -p "Do you want to link dot files for root?" choice
case "$choice" in
    y|Y ) ;;
    * ) exit;;
esac

echo "Linking dot files for root ..."
if [ $(uname) == 'Darwin' ]; then
    ROOT_HOME='/var/root'
else
    ROOT_HOME='/root'
fi

sudo mkdir -p $ROOT_HOME
sudo rm -f $ROOT_HOME/.bash_aliases $ROOT_HOME/.bashrc $ROOT_HOME/.profile $ROOT_HOME/.tmux.conf $ROOT_HOME/.vim $ROOT_HOME/.vimrc
sudo ln -s ~/.bashrc $ROOT_HOME/.bashrc
sudo ln -s ~/.bash_aliases $ROOT_HOME/.bash_aliases
sudo ln -s ~/.profile $ROOT_HOME/.profile
sudo ln -s ~/.tmux.conf $ROOT_HOME/.tmux.conf
sudo ln -s ~/.vim $ROOT_HOME/.vim
sudo ln -s ~/.vimrc $ROOT_HOME/.vimrc
