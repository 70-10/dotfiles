autoload -Uz \
peco-aws-credentials \
peco-z-search

zle -N peco-src
zle -N peco-history
zle -N peco-aws-credentials
zle -N peco-z-search
zle -N peco-use-node-version

bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "\e[3~" delete-char
bindkey '^]' peco-src
bindkey '^r' peco-history
bindkey '^w' peco-aws-credentials
bindkey '^f' peco-z-search
