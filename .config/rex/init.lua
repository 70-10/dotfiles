rex.bind("cmd+k", "com.superlogical.terminal.clear")
rex.bind("shift+cmd+k", "session.switch")

rex.bind("ctrl+alt+v", "pane.split", { direction = "right" })
rex.bind("ctrl+alt+h", "pane.split", { direction = "down" })

rex.bind("ctrl+left", "pane.focus", { direction = "left" })
rex.bind("ctrl+right", "pane.focus", { direction = "right" })
rex.bind("ctrl+up", "pane.focus", { direction = "up" })
rex.bind("ctrl+down", "pane.focus", { direction = "down" })
rex.bind("ctrl+j", "client.scroll.page_down")
rex.bind("ctrl+k", "client.scroll.page_up")
rex.bind("cmd+;", "client.font.increase")

rex.bind("ctrl+tab", "pane.send_key", { key = "tab" })
