source ~/.zplug/zplug

zplug "mollifier/cd-gitroot", as:command
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search"
zplug "themes/minimal", from:oh-my-zsh
zplug "supercrabtree/k"
zplug "mrowa44/emojify", as:command

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
