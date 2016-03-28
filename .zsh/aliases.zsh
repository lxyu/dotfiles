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
alias lh='du -sh * .* | sort -h'

alias rm="rm -I"
alias df='df -h'
alias pg='ps aux | grep'

alias tmux='tmux -2'
alias tmuxa='tmux attach -t L || tmux -2 new -s L'

alias rmds='find . -name ".DS_Store" -delete'
alias rmpyc='find . -name "*.pyc" -delete'

alias y='youtube-dl -c -f 137+172/137+140/best'
alias xld='xl download --continue --delete --tool aria2'
alias xll='xl list --speed --progress'

alias cp_p="rsync -WavP --human-readable --progress"
alias paclean="pacman -R \$(pacman -Qdtq)"


if [ "$TERM" != dumb ]; then

    # pacman
    if (( $+commands[grc] )); then
    fi

    # generic colouriser
    if (( $+commands[grc] )); then

        # Prevent grc aliases from overriding zsh completions.
        setopt COMPLETE_ALIASES

        # Supported commands
        cmds=(
            cc \
            configure \
            cvs \
            df \
            diff \
            dig \
            gcc \
            gmake \
            ifconfig \
            last \
            ldap \
            ls \
            make \
            mount \
            mtr \
            netstat \
            ping \
            ping6 \
            ps \
            traceroute \
            traceroute6 \
            wdiff \
            );

        # Set alias for available commands.
        for cmd in $cmds ; do
            if (( $+commands[$cmd] )) ; then
                alias $cmd="grc --colour=auto $cmd"
            fi
        done

        # Clean up variables
        unset cmds cmd
    fi

fi
