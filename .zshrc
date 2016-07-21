### zsh.d ###

if [ -d "${HOME}/.zsh.d" ]; then
  for f in "${HOME}"/.zsh.d/* ; do
    source ${f};
  done
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1
autoload -U compinit && compinit

setopt AUTO_MENU
setopt AUTO_CD
setopt AUTO_NAME_DIRS
setopt AUTO_LIST
setopt AUTO_PARAM_KEYS
setopt AUTO_PARAM_SLASH

### plugins ###
fpath=($HOME/.zsh.d/functions/*(N-/) $fpath)
