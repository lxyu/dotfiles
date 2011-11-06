# include .bashrc
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# set env
export CLICOLOR=1
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin/:$PATH
export PYTHONPATH=/Users/lxyu/workspace/eleme/elemedjango:$PYTHONPATH
export DJANGO_SETTINGS_MODULE=settings
