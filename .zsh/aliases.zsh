# make aliases available to sudo
alias sudo="sudo "

# default using neovim
alias v=vi
alias vi=nvim

# color grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -ahlF'
alias lg='ll | grep'
alias lh='du -sh * | sort -h'
alias lh.='du -sh * .* | sort -h'

alias rm="rm -I"
alias df='df -h'
alias pg='ps aux | grep'

alias tmux='tmux -2'
alias tmuxa='tmux attach -t L || tmux -2 new -s L'

alias rmds='find . -name ".DS_Store" -delete'
alias rmpyc='find . -name "*.pyc" -delete'

alias y='youtube-dl --continue --mark-watched --restrict-filenames --format bestvideo+bestaudio --merge-output-format mkv --prefer-ffmpeg'
alias xld='xl download --continue --delete --tool aria2'
alias xll='xl list --speed --progress'

alias cp_p="rsync -WavP --human-readable --progress"
alias paclean="pacman -R \$(pacman -Qdtq)"

alias mosh="mosh -a"

# fix zlib error
alias pyenv='LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib" CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include" PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig /usr/local/opt/sqlite/lib/pkgconfig" pyenv'

if command -v stack >/dev/null 2>&1; then
    alias hdevtools="stack exec --no-ghc-package-path -- hdevtools"
    alias ghc='stack exec -- ghc'
    alias ghci='stack exec -- ghci'
fi


if [ "$TERM" != dumb ] && command -v grc >/dev/null 2>&1; then
    # Prevent grc aliases from overriding zsh completions.
    setopt COMPLETE_ALIASES >/dev/null 2>&1

    # Supported commands
    alias colourify="grc -es --colour=auto"
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
    alias head='colourify head'
    alias tail='colourify tail'
    alias dig='colourify dig'
    alias mount='colourify mount'
    alias ps='colourify ps'
    alias mtr='colourify mtr'
    alias df='colourify df'
fi
