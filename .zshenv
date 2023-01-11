### plugins ###
typeset -gx -U fpath
fpath=( \
  /usr/local/share/zsh/site-functions(N-/) \
  $fpath \
  )
