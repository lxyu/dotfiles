alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias l='ls -CF'
alias l.='ls -dlhF .[a-zA-Z0-9]* --color=auto'
alias la='ls -Ah'
alias ll='ls -ahlF --group-directories-first'
alias ls='ls --color=auto'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias rm="rm -i"

alias df='df -h'

alias tmux='tmux -2'
alias tmuxa='tmux a || tmux'

alias rmds='find . -name ".DS_Store" -exec rm "{}" \;'
alias rmpyc='find . -name "*.pyc" -exec rm "{}" \;'

alias p='cd ~/tools/goagent/; python proxy.py'
alias wiki='python2.6 ~/tools/wiki/wikiserver.py'

alias xunlei='aria2c --load-cookie="~/cookie.txt" -c -s3'
