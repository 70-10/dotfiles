zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1
zstyle ":completion:*:commands" rehash 1

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
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_STORE
