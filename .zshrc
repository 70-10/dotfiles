typeset -Ua fpath
fpath=(${^fpath}(N-/))

if type brew &>/dev/null
then
  _brew_prefix="$(brew --prefix)"
  fpath=(
    "$_brew_prefix/share/zsh/site-functions"
    $fpath
    "$_brew_prefix/share/zsh/functions"
  )
  unset _brew_prefix
fi

# Do not pass zsh-version-specific function paths to persistent processes.
typeset +x FPATH

eval "$(sheldon source)"
