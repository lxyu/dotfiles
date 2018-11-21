#####
# env
set -x LANG "en_US.UTF-8"
set -x LANGUAGE "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x LC_TYPE "en_US.UTF-8"

set -x EDITOR vim

# select my cow
set -x ANSIBLE_COW_SELECTION sheep

# set -x gpg tty
set -x GPG_TTY (tty)

# Term info
set -x TERM xterm-256color
set -x COPYFILE_DISABLE "true"


#####
# path
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin

set -x PATH $GOBIN $HOME/.local/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/go/libexec/bin $PATH
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

#####
# install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end


#####
# python

set -x PROJECT_HOME "~/workspace"
status --is-interactive
and source (pyenv init - | psub)


#####
# alias
# make aliases available to sudo
alias sudo="sudo "

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
alias tmuxa='tmux attach -t L; or tmux -2 new -s L'

alias rmds='find . -name ".DS_Store" -delete'
alias rmpyc='find . -name "*.pyc" -delete'

alias y='youtube-dl --continue --mark-watched --restrict-filenames --format bestvideo+bestaudio --merge-output-format mkv --prefer-ffmpeg'
alias xld='xl download --continue --delete --tool aria2'
alias xll='xl list --speed --progress'

alias cp_p="rsync -WavP --human-readable --progress"
alias paclean="pacman -R (pacman -Qdtq)"

alias mosh="mosh -a"


#####
# function
function ansible_enc
    ansible-vault encrypt_string $argv | pbcopy
end

