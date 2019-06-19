#####
# env

set -x LANG "en_US.UTF-8"
set -x LANGUAGE "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x LC_TYPE "en_US.UTF-8"

set -x EDITOR vim

# select my cow
set -x ANSIBLE_COW_SELECTION random

# set -x gpg tty
set -x GPG_TTY (tty)

# term info
set -x TERM xterm-256color
set -x COPYFILE_DISABLE "true"


#####
# path

set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x GO111MODULE on

set -x PATH $GOBIN $HOME/.local/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/go/libexec/bin /usr/local/sbin /snap/bin $PATH
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

#####
# install fisher

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end


#####
# install direnv

eval (direnv hook fish)


#####
# python

if functions -q fisher
    set -x PROJECT_HOME "~/workspace"
    status --is-interactive
    and source (pyenv init - | psub)
end

if functions -q pyenv-virtualenv-init
    status --is-interactive
    and source (pyenv virtualenv-init - | psub)
end


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

alias y='youtube-dl --continue --mark-watched --restrict-filenames --format bestvideo+bestaudio --merge-output-format mp4 --prefer-ffmpeg'
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

function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert
    # Without an argument, fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings insert
    bind -M insert \cf accept-autosuggestion
    bind \cf accept-autosuggestion
end

fish_user_key_bindings

# set -g fish_user_paths "/usr/local/opt/qt/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
