export PATH="$HOME/.local/bin:$HOME/.local/share/mise/shims:$PATH"

typeset -Ua fpath
fpath=(${^fpath}(N-/))

if type brew &>/dev/null
then
  _brew_prefix="$(brew --prefix)"
  fpath=(
    "$_brew_prefix/share/zsh/site-functions"
    $fpath
  )
  unset _brew_prefix
fi

# Do not pass zsh-version-specific function paths to persistent processes.
typeset +x FPATH

# sheldon source をキャッシュ化（plugins.toml / プラグインディレクトリ変更時のみ再生成）
() {
  local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/sheldon"
  local cache="$cache_dir/source.zsh"
  local toml="${XDG_CONFIG_HOME:-$HOME/.config}/sheldon/plugins.toml"
  local df="$HOME/dev/src/github.com/70-10/dotfiles"
  if [[ ! -r $cache || $toml -nt $cache || $df/.config/zsh/sync -nt $cache || $df/.config/zsh/defer -nt $cache ]]; then
    [[ -d $cache_dir ]] || mkdir -p $cache_dir
    # sheldon は source 先が無くても exit 0 で ERROR を出すだけなので、ERROR があればキャッシュしない
    local err
    if err=$(sheldon source 2>&1 > $cache.tmp) && [[ $err != *ERROR* ]]; then
      mv $cache.tmp $cache
    else
      source $cache.tmp
      rm -f $cache.tmp
      return
    fi
  fi
  source $cache
}

[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local
