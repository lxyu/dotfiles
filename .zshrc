source ~/.zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the pure theme.
PURE_PROMPT_SYMBOL='>'
PURE_GIT_UP_ARROW="↑"
PURE_GIT_DOWN_ARROW="↓"
PURE_GIT_UNTRACKED_DIRTY=0

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Bundles from the default repo (oh-my-zsh).
antigen bundles <<EOBUNDLES
    command-not-found
    common-aliases
    extract
    gitfast
    httpie
    redis-cli
    ssh-agent
    z

    # Python Plugins
    pip
    python
    virtualenv
    virtualenvwrapper

    # Haskell Plugins
    cabal
    stack

    # Scala Plugins
    sbt
    scala
EOBUNDLES

# Antigen Plugins
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)

antigen bundles <<EOBUNDLES
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
    zsh-users/zsh-completions
EOBUNDLES

# other plugins
antigen bundles << Plugins
    trapd00r/zsh-syntax-highlighting-filetypes 
    Tarrasch/zsh-bd
Plugins

# OS specific plugins
OS=`uname`
if [[ $OS == 'Darwin' ]]; then
    antigen bundles <<OSX
    atom
    brew
    brew-cask
    osx
OSX
elif [[ $OS == 'Linux' ]]; then
    antigen bundles <<Linux
    archlinux
    systemd
Linux
fi

# Tell antigen that you're done.
antigen apply

#####

# load local configs
for file in ~/.zsh/{aliases,env,fn,misc,path}.zsh; do
    [ -r "$file" ] && source "$file"
done
