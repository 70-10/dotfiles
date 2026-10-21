# terminal-browser には倍率を固定する設定が無く、リサイズで積み上がった倍率がページごとに保存されて次に開いたときも使われるため、
# 起動前に保存値を消す（https://github.com/zenbu-labs/terminal-browser/issues/166）
terminal-browser() {
  local appdata=${TERMINAL_BROWSER_APPDATA:-$HOME/Library/Application Support}
  local dir prefs holder
  for dir in "$appdata"/terminal-browser-*(N/); do
    prefs=$dir/Preferences
    [[ -f $prefs ]] || continue
    # 使用中のプロファイルを書き換えても、終了時に Preferences が上書きされる
    holder=$(cat "$dir/terminal-browser.lock" 2>/dev/null)
    if [[ $holder == <-> ]] && ps -p $holder -o command= 2>/dev/null | grep -q terminal-browser; then
      continue
    fi
    jq -e '.partition.per_host_zoom_levels' "$prefs" &>/dev/null || continue
    jq 'del(.partition.per_host_zoom_levels)' "$prefs" > "$prefs.tmp" && mv "$prefs.tmp" "$prefs" || rm -f "$prefs.tmp"
  done
  command terminal-browser "$@"
}
