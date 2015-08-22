#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

### Antigen ###
source $HOME/.antigen/antigen.zsh
antigen bundle sorin-ionescu/prezto


### zsh.d ###

if [ -d "${HOME}/.zsh.d" ]; then
  for f in "${HOME}"/.zsh.d/* ; do
    source ${f};
  done
fi

### plugins ###
fpath=($HOME/.zsh.d/functions/*(N-/) $fpath)
