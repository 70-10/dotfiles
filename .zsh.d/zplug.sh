export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "70-10/zsh-alias"
zplug "70-10/docker-alias"
zplug "70-10/node-alias"
zplug "mollifier/cd-gitroot"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:1
zplug "zsh-users/zsh-history-substring-search"
zplug "themes/minimal", from:oh-my-zsh, as:theme
zplug "supercrabtree/k"
zplug "b4b4r07/http_code"
zplug "paulirish/git-open", as:command
zplug "paulirish/git-recent", as:command
zplug "jhawthorn/fzy", as:command, hook-build:'make'
zplug "b4b4r07/git-br", as:command, use:'git-br'
zplug "b4b4r07/richpager", as:command, use:"richpager"

zplug "gchaincl/httplab", as:command, from:gh-r
zplug "asciimoo/wuzz", as:command, from:gh-r

zplug "takaaki-kasai/git-foresta", as:command
zplug "lukechilds/zsh-better-npm-completion", defer:1
zplug "b4b4r07/enhancd", use:init.sh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

export ENHANCD_FILTER=peco
