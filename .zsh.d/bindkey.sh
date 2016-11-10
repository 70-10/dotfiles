autoload -Uz peco-src peco-history
zle -N peco-src
zle -N peco-history

bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "\e[3~" delete-char
bindkey '^]' peco-src
bindkey '^r' peco-history
