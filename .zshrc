### zsh.d ###

if [ -d "${HOME}/.zsh.d" ]; then
  for f in "${HOME}"/.zsh.d/* ; do
    source ${f};
  done
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1
autoload -U compinit && compinit

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt AUTO_MENU
setopt AUTO_CD
setopt AUTO_NAME_DIRS
setopt AUTO_LIST
setopt AUTO_PARAM_KEYS
setopt AUTO_PARAM_SLASH
setopt SHARE_HISTORY

### plugins ###
fpath=($HOME/.zsh.d/functions/*(N-/) $fpath)
