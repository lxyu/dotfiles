# include .bashrc
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# set env

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ $(uname) == 'Darwin' ]; then
    export CLICOLOR=1
    export PATH=$(brew --prefix coreutils)/libexec/gnubin:$HOME/bin/:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:$PATH
else
    export PATH=$HOME/bin/:$PATH
fi

export PYTHONPATH=$HOME/workspace/eleme/elemedjango:$HOME/workspace/eleme/zeus
export DJANGO_SETTINGS_MODULE=settings
