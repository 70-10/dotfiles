### plugins ###
typeset -gx -U fpath
fpath=( \
  $HOME/.zsh.d/functions/*(N-/) \
  $HOME/.zsh.d/Completion(N-/) \
  /usr/local/share/zsh/site-functions(N-/) \
  /usr/local/share/zsh-completions(N-/) \
  $HOME/.nodebrew/completions/zsh \
  $fpath \
  )

autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
