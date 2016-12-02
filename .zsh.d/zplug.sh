source ~/.zplug/init.zsh

zplug "70-10/zsh-alias"
zplug "mollifier/cd-gitroot"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search"
zplug "themes/minimal", from:oh-my-zsh, as:theme
zplug "supercrabtree/k"
zplug "mrowa44/emojify", as:command
zplug "b4b4r07/http_code", as:command, use:bin
zplug "paulirish/git-open", as:command
zplug "paulirish/git-recent", as:command

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
