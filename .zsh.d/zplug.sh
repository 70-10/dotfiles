export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:1
zplug "zsh-users/zsh-history-substring-search"
zplug "themes/minimal", from:oh-my-zsh, as:theme
zplug "paulirish/git-open", as:command
zplug "b4b4r07/git-br", as:command, use:'git-br'

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

export ENHANCD_FILTER=peco
