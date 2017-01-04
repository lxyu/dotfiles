export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# hombrew
if (( $+commands[brew] )); then
    if [[ -d $(brew --prefix coreutils) ]]; then
        export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
        export MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH
    fi

    if [[ -d $(brew --prefix ruby) ]]; then
        export PATH=$(brew --prefix ruby)/bin:$PATH
    fi

    if [[ -f $(brew --prefix)/etc/grc.bashrc ]]; then
        source $(brew --prefix)/etc/grc.bashrc
    fi

    if [[ -d /usr/local/share/npm/bin ]]; then
        export PATH=$PATH:/usr/local/share/npm/bin
    fi

    if [[ -d /usr/local/opt/go/libexec/bin ]]; then
        export export PATH=$PATH:/usr/local/opt/go/libexec/bin
    fi
fi

# android
if [[ -d $HOME/tools/android/platform-tools ]]; then
    export PATH=$HOME/tools/android/platform-tools:$HOME/tools/android/platform:$HOME/tools/android/tools:$PATH
fi

if [[ -d /opt/android-sdk ]]; then
    export PATH=/opt/android-sdk/platform-tools:/opt/android-sdk/tools:$PATH
fi

# perl
if [[ -d /usr/bin/core_perl/ ]]; then
    export PATH=$PATH:/usr/bin/core_perl
fi

if [[ -d /usr/bin/core_perl/ ]]; then
    export PATH=$PATH:/usr/bin/vendor_perl
fi

# python
if (( $+commands[pyenv] )); then
    if (( $+commands[brew] )); then
        export PYENV_ROOT=/usr/local/var/pyenv
    else
        export PYENV_ROOT=$HOME/.pyenv
    fi

    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV=true
    export PATH=$PYENV_ROOT/shims:$PATH

fi

if [[ -d /opt/jython ]]; then
    export PATH=$PATH:/opt/jython/bin
fi

# ruby
[[ -s $HOME/.rvm/scripts/rvm ]] && . $HOME/.rvm/scripts/rvm

# haskell
# if [[ -d $HOME/.cabal/bin ]]; then
#     export PATH=$HOME/.cabal/bin:$PATH
# fi

if [[ -d $HOME/.local/bin ]]; then
    export PATH=$HOME/.local/bin:$PATH
fi

# rust
if [[ -d $HOME/.cargo/bin ]]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

# user bin
if [[ -d $HOME/bin ]]; then
    export PATH=$HOME/bin:$PATH
fi
