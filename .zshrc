### zsh.d ###

if [ -d "${HOME}/.zsh.d" ]; then
  for f in "${HOME}"/.zsh.d/* ; do
    source ${f};
  done
fi

### zsh-completions ###
fpath=(/usr/local/share/zsh-completions $fpath)

### plugins ###
fpath=($HOME/.zsh.d/functions/*(N-/) $fpath)
