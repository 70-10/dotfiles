if type terminal-browser &>/dev/null
then
  # Not a setting or a patch to the bundled main.js: no setting pins the page zoom,
  # and brew upgrade would undo the patch (https://github.com/zenbu-labs/terminal-browser/issues/166).
  terminal-browser() {
    local appdata=${TERMINAL_BROWSER_APPDATA:-$HOME/Library/Application Support}
    local dir prefs holder
    for dir in "$appdata"/terminal-browser-*(N/); do
      prefs=$dir/Preferences
      [[ -f $prefs ]] || continue
      # Not clearing profiles in use: the running browser writes Preferences back on exit.
      holder=$(cat "$dir/terminal-browser.lock" 2>/dev/null)
      if [[ $holder == <-> ]] && ps -p $holder -o command= 2>/dev/null | grep -q terminal-browser; then
        continue
      fi
      jq -e '.partition.per_host_zoom_levels' "$prefs" &>/dev/null || continue
      jq 'del(.partition.per_host_zoom_levels)' "$prefs" > "$prefs.tmp" && mv "$prefs.tmp" "$prefs" || rm -f "$prefs.tmp"
    done
    command terminal-browser "$@"
  }
fi
