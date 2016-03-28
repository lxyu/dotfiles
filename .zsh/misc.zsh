# vim bindings
bindkey -v

# bind up and down arrow keys for history search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# autosuggestions config
bindkey '^f' vi-forward-blank-word
bindkey '^j' autosuggest-accept

# history mgmt
# http://www.refining-linux.org/archives/49/ZSH-Gem-15-Shared-history/
setopt inc_append_history
setopt share_history

# allow ssh tab completion for mosh hostnames
compdef mosh=ssh

# ignore hosts file on zsh completion
zstyle ':completion:*' hosts off
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
