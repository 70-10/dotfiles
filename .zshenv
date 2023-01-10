### plugins ###
typeset -gx -U fpath
fpath=( \
  $HOME/.zsh.d/functions/*(N-/) \
  /usr/local/share/zsh/site-functions(N-/) \
  /usr/local/share/zsh-completions(N-/) \
  $fpath \
  )

autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz cdu
