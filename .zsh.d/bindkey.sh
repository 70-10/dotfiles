autoload -Uz peco-src peco-history peco-aws-credentials
zle -N peco-src
zle -N peco-history
zle -N peco-aws-credentials

bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "\e[3~" delete-char
bindkey '^]' peco-src
bindkey '^r' peco-history
bindkey '^w' peco-aws-credentials
