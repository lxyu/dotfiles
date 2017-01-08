#!/bin/zsh

# remove existing files
echo "Cloning new dot files ..."
/usr/bin/env git clone git://github.com/lxyu/dotfiles.git ~/.dotfiles || exit 1

echo "Linking..."

fs=(
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

    .ghc \
    .i3 \
    .irssi \
    .pentadactyl \
    .pip \
    .tmux-themes \
    .virtualenvs \
    .zsh \
    );

for f in $fs ; do
    ln -vsfn ~/.dotfiles/$f ~/$f
done

# link nvim config
mkdir -p ~/.config/nvim
ln -vsfn ~/.dotfiles/.vim/vimrc ~/.config/nvim/init.vim

# link mpv config
mkdir -p ~/.config/mpv
ln -vsfn ~/.dotfiles/mpv.conf ~/.config/mpv/mpv.conf

# link user systemd service files
mkdir -p ~/.config/systemd/user/
ln -vsfn ~/.dotfiles/emacs.service ~/.config/systemd/user/emacs.service

# config & start emacs server
pidof systemd && systemctl --user enable emacs && systemctl --user start emacs
cp ~/.dotfiles/bin/emc /usr/local/bin/
