
# [Conditional multipurpose modmap] Multipurpose modmap in certain conditions,
# such as for a particular device.
# multipurpose_modmap("Microsoft keyboard", {
#     # Left shift is open paren when pressed and released.
#     # Left shift when held down.
#     Key.LEFT_SHIFT: [Key.KPLEFTPAREN, Key.LEFT_SHIFT],

#     # Right shift is close paren when pressed and released.
#     # Right shift when held down.
#     Key.RIGHT_SHIFT: [Key.KPRIGHTPAREN, Key.RIGHT_SHIFT]
# }, when = lambda ctx: ctx.device_name.startswith("Microsoft"))

modmap("caps as control", {
    Key.CAPSLOCK: Key.LEFT_CTRL
})

# Keybindings for Firefox
keymap("Firefox", {
    # switch next/previous tab
    C("Alt-Shift-right_brace"): C("C-TAB"),
    C("Alt-Shift-left_brace"): C("C-Shift-TAB"),
    # forward/back
    C("Alt-right_brace"): C("C-right_brace"),
    C("Alt-left_brace"): C("C-left_brace"),

    # Type C-esc to focus to the content
    C("C-esc"): C("C-f6"),

    # alternative for C-k because that's in use by emacs kill line.
    # useful for "add link" in gdocs, e.g.
    C("C-Alt-k"): C("C-k"),

    # reload/tab keys
    C("Alt-r"): C("C-r"),
    C("Alt-Shift-r"): C("C-Shift-r"),
    C("Alt-t"): C("C-t"),
    C("Alt-Shift-t"): C("C-Shift-t"),
    C("C-t"): C("Alt-t"),

    # find
    C("Alt-f"): C("C-f"),
    C("Alt-g"): C("C-g"),
    C("Alt-Shift-f"): C("C-Shift-f")
}, when = wm_class_match(r"firefox"))


# Keybindings for Slack
keymap("Slack", {
    # Find
    C("Alt-f"): C("C-f"),
    # Reload
    C("Alt-r"): C("C-r"),
    # palette
    C("Alt-k"): C("C-k"),
    # back and forward
    C("C-comma"): C("Alt-left"),
    C("C-dot"): C("Alt-right"),
    # preferences
    C("Alt-comma"): C("C-comma"),

    # edit last message with ctrl-shift-p
    C("C-Shift-p"): C("C-up")
}, when = wm_class_match(r"Slack"))

# Emacs-like keybindings in non-Emacs applications
keymap("Emacs-like keys", {
    # Cursor
    C("C-j"): with_mark(C("left")),
    C("C-l"): with_mark(C("right")),
    C("C-p"): with_mark(C("up")),
    C("C-n"): with_mark(C("down")),
    # C("C-h"): with_mark(C("backspace")),
    # Forward/Backward word
    C("C-h"): with_mark(C("C-left")),
    C("C-semicolon"): with_mark(C("C-right")),
    # Beginning/End of line
    C("C-a"): with_mark(C("home")),
    C("C-e"): with_mark(C("end")),
    # Page up/down
    # C("Alt-v"): with_mark(C("page_up")),
    # C("C-v"): with_mark(C("page_down")),
    # Beginning/End of file
    C("C-Alt-comma"): with_mark(C("C-home")),
    C("C-Alt-dot"): with_mark(C("C-end")),
    # Newline
    # C("C-m"): C("enter"),
    # C("C-j"): C("enter"),
    # C("C-o"): [C("enter"), C("left")],
    # Copy
    C("Alt-x"): [C("C-x"), set_mark(False)],
    C("Alt-c"): [C("C-c"), set_mark(False)],
    C("Alt-v"): [C("C-v"), set_mark(False)],
    # Delete
    C("C-d"): [C("delete"), set_mark(False)],
    C("Alt-d"): [C("C-delete"), set_mark(False)],
    # Kill line
    C("C-k"): [C("Shift-end"), C("C-x"), set_mark(False)],
    # Undo
    C("Alt-z"): [C("C-z"), set_mark(False)],
    # C("C-Shift-ro"): C("C-z"),
    # Mark
    C("C-f"): set_mark(True),
    C("C-Alt-space"): with_or_set_mark(C("C-right")),
    # Search
    C("Alt-f"): C("F3"),
    C("Alt-Shift-f"): C("Shift-F3"),
    # C("Alt-Shift-key_5"): C("C-h"),
    # Cancel
    C("C-g"): [C("esc"), set_mark(False)]
    # Escape
    # C("C-q"): escape_next_key,
    # C-x YYY
    # C("C-x"): {
    #     # C-x h (select all)
    #     C("h"): [C("C-home"), C("C-a"), set_mark(True)],
    #     # C-x C-f (open)
    #     C("C-f"): C("C-o"),
    #     # C-x C-s (save)
    #     C("C-s"): C("C-s"),
    #     # C-x k (kill tab)
    #     C("k"): C("C-f4"),
    #     # C-x C-c (exit)
    #     C("C-c"): C("C-q"),
    #     # cancel
    #     C("C-g"): ignore_key,
    #     # C-x u (undo)
    #     C("u"): [C("C-z"), set_mark(False)],
    # }
}, when = not_wm_class_match(r"Emacs"))
