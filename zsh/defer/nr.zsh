if type nr &>/dev/null
then
  _nr_completion() {
    local -a completions
    completions=("${(f)$(nr --completion ${words[2,-1]} 2>/dev/null)}")

    compadd -a completions
  }

  compdef _nr_completion nr
fi
