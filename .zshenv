### plugins ###
typeset -gx -U fpath
fpath=( \
  $HOME/.zsh.d/functions/*(N-/) \
  $HOME/.zsh.d/Completion(N-/) \
  /usr/local/share/zsh/site-functions \
  $fpath \
  )

autoload -U compinit && compinit
