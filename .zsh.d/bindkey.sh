zle -N peco-src

bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "\e[3~" delete-char
bindkey '^]' peco-src
