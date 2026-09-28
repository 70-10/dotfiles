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
