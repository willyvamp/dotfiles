local mainMod = "SUPER"

-- Applications
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "rofi -show drun"

-- ╭──────────────────────────────────────────────╮
-- │ Applications                                  │
-- ╰──────────────────────────────────────────────╯

-- SUPER + ENTER → Terminal
hl.bind(
    mainMod .. " + RETURN",
    hl.dsp.exec_cmd(terminal)
)

-- SUPER + Q → Kill active window
hl.bind(
    mainMod .. " + Q",
    hl.dsp.window.close()
)

-- SUPER + M → Shutdown Hyprland
hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd(
        "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
    )
)

-- SUPER + E → File manager
hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(fileManager)
)

-- SUPER + F → Toggle floating
hl.bind(
    mainMod .. " + F",
    hl.dsp.window.float({ action = "toggle" })
)

-- SUPER + R → Application launcher
hl.bind(
    mainMod .. " + R",
    hl.dsp.exec_cmd(menu)
)

-- SUPER + P → Hyprlock
hl.bind(
    mainMod .. " + P",
    hl.dsp.exec_cmd("hyprlock")
)


-- ╭──────────────────────────────────────────────╮
-- │ Move focus                                    │
-- ╰──────────────────────────────────────────────╯

hl.bind(
    mainMod .. " + H",
    hl.dsp.focus({ direction = "l" })
)

hl.bind(
    mainMod .. " + J",
    hl.dsp.focus({ direction = "d" })
)

hl.bind(
    mainMod .. " + K",
    hl.dsp.focus({ direction = "u" })
)

hl.bind(
    mainMod .. " + L",
    hl.dsp.focus({ direction = "r" })
)


-- ╭──────────────────────────────────────────────╮
-- │ Move active window                            │
-- ╰──────────────────────────────────────────────╯

hl.bind(
    mainMod .. " + SHIFT + H",
    hl.dsp.window.move({ direction = "l" })
)

hl.bind(
    mainMod .. " + SHIFT + J",
    hl.dsp.window.move({ direction = "d" })
)

hl.bind(
    mainMod .. " + SHIFT + K",
    hl.dsp.window.move({ direction = "u" })
)

hl.bind(
    mainMod .. " + SHIFT + L",
    hl.dsp.window.move({ direction = "r" })
)


-- ╭──────────────────────────────────────────────╮
-- │ Resize mode                                   │
-- ╰──────────────────────────────────────────────╯

hl.bind(
    mainMod .. " + S",
    hl.dsp.submap("resize")
)

hl.define_submap("resize", function()

    -- H → decrease width
    hl.bind(
        "H",
        hl.dsp.window.resize({
            x = -30,
            y = 0,
            relative = true
        }),
        { repeating = true }
    )

    -- L → increase width
    hl.bind(
        "L",
        hl.dsp.window.resize({
            x = 30,
            y = 0,
            relative = true
        }),
        { repeating = true }
    )

    -- K → decrease height
    hl.bind(
        "K",
        hl.dsp.window.resize({
            x = 0,
            y = -30,
            relative = true
        }),
        { repeating = true }
    )

    -- J → increase height
    hl.bind(
        "J",
        hl.dsp.window.resize({
            x = 0,
            y = 30,
            relative = true
        }),
        { repeating = true }
    )

    -- SUPER + D → exit resize mode
    hl.bind(
        mainMod .. " + D",
        hl.dsp.submap("reset")
    )

    -- ESC → exit resize mode
    hl.bind(
        "Escape",
        hl.dsp.submap("reset")
    )

    -- ENTER → exit resize mode
    hl.bind(
        "RETURN",
        hl.dsp.submap("reset")
    )
end)


-- ╭──────────────────────────────────────────────╮
-- │ Workspaces                                   │
-- ╰──────────────────────────────────────────────╯

-- SUPER + [0-9] → switch workspace
-- SUPER + SHIFT + [0-9] → move active window to workspace

for i = 1, 10 do
    local key = i % 10

    -- SUPER + 1..9, SUPER + 0
    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    -- SUPER + SHIFT + 1..9, SUPER + SHIFT + 0
    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end


-- ╭──────────────────────────────────────────────╮
-- │ Clipboard                                    │
-- ╰──────────────────────────────────────────────╯

hl.bind(
    mainMod .. " + V",
    hl.dsp.exec_cmd(
        "cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"
    )
)


-- ╭──────────────────────────────────────────────╮
-- │ Screenshot                                   │
-- ╰──────────────────────────────────────────────╯

hl.bind(
    "Print",
    hl.dsp.exec_cmd("hyprshot -m region")
)


-- ╭──────────────────────────────────────────────╮
-- │ Workspace scrolling                          │
-- ╰──────────────────────────────────────────────╯

hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)


-- ╭──────────────────────────────────────────────╮
-- │ Mouse window movement / resizing              │
-- ╰──────────────────────────────────────────────╯

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)


-- ╭──────────────────────────────────────────────╮
-- │ Volume / brightness                          │
-- ╰──────────────────────────────────────────────╯

-- Volume up
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ),
    {
        locked = true,
        repeating = true
    }
)

-- Volume down
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ),
    {
        locked = true,
        repeating = true
    }
)

-- Mute speaker
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ),
    {
        locked = true,
        repeating = true
    }
)

-- Mute microphone
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ),
    {
        locked = true,
        repeating = true
    }
)

-- Brightness up
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%+"
    ),
    {
        locked = true,
        repeating = true
    }
)

-- Brightness down
hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%-"
    ),
    {
        locked = true,
        repeating = true
    }
)


-- ╭──────────────────────────────────────────────╮
-- │ Media controls                               │
-- ╰──────────────────────────────────────────────╯

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)


-- ╭──────────────────────────────────────────────╮
-- │ Suspend                                     │
-- ╰──────────────────────────────────────────────╯

-- SUPER + SHIFT + `
hl.bind(
    mainMod .. " + SHIFT + grave",
    hl.dsp.exec_cmd("systemctl suspend")
)
