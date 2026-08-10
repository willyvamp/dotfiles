hl.window_rule({ name = "modal-open", match = { title = "^(Open)$" }, float = true })
hl.window_rule({ name = "modal-choose-files", match = { title = "^(Choose Files)$" }, float = true })
hl.window_rule({ name = "modal-save-as", match = { title = "^(Save As)$" }, float = true })
hl.window_rule({ name = "modal-confirm-replace", match = { title = "^(Confirm to replace files)$" }, float = true })
hl.window_rule({ name = "modal-file-op-progress", match = { title = "^(File Operation Progress)$" }, float = true })
hl.window_rule({
	name = "chrome-open-files",
	match = { class = "^(google-chrome)$", title = "^(Open Files)$" },
	float = true,
})
hl.window_rule({
	name = "chrome-open-file",
	match = { class = "^(google-chrome)$", title = "^(Open File)$" },
	float = true,
})



local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
