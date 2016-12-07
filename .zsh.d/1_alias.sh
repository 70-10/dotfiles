alias cdu='cd-gitroot'
alias ka='k -a'
alias mkdirp='mkdir -p'
alias resource='source ~/.zshrc'

alias trje='trans ja:en'
alias trej='trans en:ja'

alias ssh-configs='cat ~/.ssh/config| grep "Host " | sed -e "s/Host //g"'

# docker
alias d-rmall='docker rm -v $(docker ps -aq -f status=exited)'

alias pcd='cd $(find . -maxdepth 1 -type d | peco)'
