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

# check if brew exist
hash brew 2>&-
if [ $? -eq 0 ]; then
    export PATH=$(brew --prefix coreutils)/libexec/gnubin:$HOME/bin/:/usr/local/bin:/usr/local/sbin:$PATH
else
    export PATH=$HOME/bin/:$PATH
fi

export PYTHONPATH=$HOME/workspace/eleme/elemedjango:$HOME/workspace/eleme/zeus
export DJANGO_SETTINGS_MODULE=settings
