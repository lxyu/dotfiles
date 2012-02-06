# include .bashrc
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# set env
export CLICOLOR=1
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH=$HOME/bin/:$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH
export PYTHONPATH=$HOME/workspace/eleme/elemedjango:$HOME/workspace/eleme/zeus
export DJANGO_SETTINGS_MODULE=settings
