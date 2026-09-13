local programs = require("lua.programs")

local terminal = programs.terminal
local fileManager = programs.fileManager


-- =========================================
-- APPLICATIONS
-- =========================================

hl.bind("SUPER + U", hl.dsp.exec_cmd("prime-run unityhub"))
hl.bind("SUPER + O", hl.dsp.exec_cmd("prime-run obs"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("prime-run code"))
hl.bind("SUPER + K", hl.dsp.exec_cmd("prime-run kdenlive"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(
    "Print",
    hl.dsp.exec_cmd(
        [[grim -g "$(slurp)" - | wl-copy && notify-send "Captura tomada"]]
    )
)

hl.bind(
    "SUPER + N",
    hl.dsp.exec_cmd("swaync-client -t sw")
)

hl.bind(
    "SUPER + B",
    hl.dsp.exec_cmd("brave")
)

hl.bind(
    "SUPER + D",
    hl.dsp.exec_cmd("prime-run discord")
)

hl.bind(
    "SUPER + T",
    hl.dsp.exec_cmd(terminal)
)

hl.bind(
    "SUPER + Q",
    hl.dsp.window.close()
)

hl.bind(
    "SUPER + M",
    hl.dsp.exec_cmd("prime-run spotify")
)

hl.bind(
    "SUPER + E",
    hl.dsp.exec_cmd(fileManager)
)

hl.bind(
    "SUPER + V",
    hl.dsp.window.float({
        action = "toggle",
    })
)

hl.bind(
    "SUPER + P",
    hl.dsp.window.pseudo()
)

hl.bind(
    "SUPER + SHIFT + P",
    hl.dsp.exec_cmd(
        "/opt/splunk/bin/splunk start --accept-license && brave http://localhost:8000"
    )
)

hl.bind(
    "SUPER + SHIFT + X",
    hl.dsp.exec_cmd(
        "/opt/splunk/bin/splunk stop"
    )
)


-- =========================================
-- ROFI / LAUNCHERS
-- =========================================

hl.bind(
    "SUPER + SPACE",
    hl.dsp.exec_cmd(
        "~/.config/rofi/launchers/launcher.sh || killall -9 rofi"
    )
)

hl.bind(
    "SUPER + SHIFT + S",
    hl.dsp.exec_cmd("hyprshot -m region -o")
)

hl.bind(
    "SUPER + SHIFT + W",
    hl.dsp.exec_cmd("~/.config/scripts/launch.sh")
)

hl.bind(
    "SUPER + A",
    hl.dsp.exec_cmd("swaync-client -t -sw")
)

hl.bind(
    "SUPER + W",
    hl.dsp.exec_cmd("~/.config/rofi/launchers/wall-changer.sh")
)

hl.bind(
    "ALT + Tab",
    hl.dsp.exec_cmd("snappy-switcher next")
)

hl.bind(
    "ALT + V",
    hl.dsp.exec_cmd("~/.config/scripts/infinite-desktop.sh")
)

hl.bind(
    "SUPER + SHIFT + V",
    hl.dsp.exec_cmd("~/.config/scripts/floating-toggle.sh")
)

hl.bind(
    "CTRL + M",
    hl.dsp.exec_cmd("~/.config/rofi/launchers/powermenu.sh")
)


-- =========================================
-- KEYBOARD LAYOUT
-- =========================================

-- US <-> ES
-- SUPER + SHIFT + SPACE

hl.bind(
    "SUPER + SHIFT + SPACE",
    hl.dsp.exec_cmd(
        "hyprctl switchxkblayout all next"
    )
)


-- =========================================
-- WINDOW FOCUS
-- =========================================

hl.bind(
    "SUPER + left",
    hl.dsp.focus({
        direction = "left",
    })
)

hl.bind(
    "SUPER + right",
    hl.dsp.focus({
        direction = "right",
    })
)

hl.bind(
    "SUPER + up",
    hl.dsp.focus({
        direction = "up",
    })
)

hl.bind(
    "SUPER + down",
    hl.dsp.focus({
        direction = "down",
    })
)


-- =========================================
-- MOVE WINDOWS
-- =========================================

hl.bind(
    "SUPER + SHIFT + LEFT",
    hl.dsp.window.move({
        direction = "left",
        group_aware = true,
    })
)

hl.bind(
    "SUPER + SHIFT + RIGHT",
    hl.dsp.window.move({
        direction = "right",
        group_aware = true,
    })
)

hl.bind(
    "SUPER + SHIFT + UP",
    hl.dsp.window.move({
        direction = "up",
        group_aware = true,
    })
)

hl.bind(
    "SUPER + SHIFT + DOWN",
    hl.dsp.window.move({
        direction = "down",
        group_aware = true,
    })
)


-- =========================================
-- WORKSPACES
-- =========================================

for i = 1, 10 do
    local key = i % 10

    -- SUPER + number -> workspace
    hl.bind(
        "SUPER + " .. key,
        hl.dsp.focus({
            workspace = i,
        })
    )

    -- SUPER + SHIFT + number -> move window
    hl.bind(
        "SUPER + SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = i,
        })
    )
end


-- =========================================
-- SPECIAL WORKSPACE
-- =========================================

hl.bind(
    "SUPER + S",
    hl.dsp.workspace.toggle_special("magic")
)


-- =========================================
-- WORKSPACE SCROLL
-- =========================================

hl.bind(
    "SUPER + mouse_down",
    hl.dsp.focus({
        workspace = "e+1",
    })
)

hl.bind(
    "SUPER + mouse_up",
    hl.dsp.focus({
        workspace = "e-1",
    })
)


-- =========================================
-- MOVE / RESIZE WITH MOUSE
-- =========================================

hl.bind(
    "SUPER + mouse:272",
    hl.dsp.window.drag(),
    {
        mouse = true,
    }
)

hl.bind(
    "SUPER + mouse:273",
    hl.dsp.window.resize(),
    {
        mouse = true,
    }
)


-- =========================================
-- RESIZE ACTIVE WINDOW
-- =========================================

hl.bind(
    "SUPER + ALT + right",
    hl.dsp.exec_cmd("hyprctl dispatch resizeactive 15 0")
)

hl.bind(
    "SUPER + ALT + left",
    hl.dsp.exec_cmd("hyprctl dispatch resizeactive -15 0")
)

hl.bind(
    "SUPER + ALT + up",
    hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -15")
)

hl.bind(
    "SUPER + ALT + down",
    hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 15")
)


-- =========================================
-- VOLUME
-- =========================================

-- Laptop / multimedia keys

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ),
    {
        locked = true,
        repeating = true,
    }
)


-- =========================================
-- STANDARD KEYBOARD CONTROLS
-- =========================================

-- CTRL + ALT + UP    = Volume up
-- CTRL + ALT + DOWN  = Volume down
-- CTRL + ALT + M     = Mute

hl.bind(
    "CTRL + ALT + up",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    )
)

hl.bind(
    "CTRL + ALT + down",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    )
)

hl.bind(
    "CTRL + ALT + M",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    )
)


-- =========================================
-- BRIGHTNESS
-- =========================================

-- Laptop / multimedia keys

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%-"
    ),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%+"
    ),
    {
        locked = true,
        repeating = true,
    }
)


-- =========================================
-- STANDARD KEYBOARD BRIGHTNESS
-- =========================================

-- CTRL + ALT + LEFT  = Brightness down
-- CTRL + ALT + RIGHT = Brightness up

hl.bind(
    "CTRL + ALT + left",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%-"
    )
)

hl.bind(
    "CTRL + ALT + right",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%+"
    )
)


-- =========================================
-- MEDIA
-- =========================================

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    {
        locked = true,
    }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    {
        locked = true,
    }
)


-- =========================================
-- INFINITE DESKTOP
-- =========================================

hl.bind(
    "CTRL + SUPER + right",
    hl.dsp.exec_cmd(
        "echo right > /tmp/infinite-nav"
    )
)

hl.bind(
    "CTRL + SUPER + left",
    hl.dsp.exec_cmd(
        "echo left > /tmp/infinite-nav"
    )
)
