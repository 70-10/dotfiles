### prompt ###
function git-prompt {
  local branchname branch st
  branchname=`git symbolic-ref --short HEAD 2> /dev/null`
  if [ -z $branchname ]; then
    return
  fi
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    branch="%{$fg[white]%}[$branchname]%{$reset_color%}"
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    branch="%{$fg[white]%}[$branchname%{$fg[yellow]%}●%{$fg[white]%}]%{$reset_color%}"
  else
    branch="%{$fg[white]%}[$branchname%{$fg[red]%}●%{$fg[white]%}]%{$reset_color%}"
  fi

  echo "$branch"
}

PROMPT='%2~ $(git-prompt)»%b '
setopt prompt_subst


### zsh.d ###
if [ -d "${HOME}/.zsh.d" ]; then
  for f in "${HOME}"/.zsh.d/* ; do
    source ${f};
  done
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

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

eval "$(sheldon source)"
