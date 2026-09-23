-- ▗▄▄▖ ▗▄▄▄▖▗▖  ▗▖▗▄▄▄  ▗▄▄▄▖▗▖  ▗▖ ▗▄▄▖ ▗▄▄▖
-- ▐▌ ▐▌  █  ▐▛▚▖▐▌▐▌  █   █  ▐▛▚▖▐▌▐▌   ▐▌
-- ▐▛▀▚▖  █  ▐▌ ▝▜▌▐▌  █   █  ▐▌ ▝▜▌▐▌▝▜▌ ▝▀▚▖
-- ▐▙▄▞▘▗▄█▄▖▐▌  ▐▌▐▙▄▄▀ ▗▄█▄▖▐▌  ▐▌▝▚▄▞▘▗▄▄▞▘

-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Change an existing binding with o.rebind, or disable one with:
--   hl.unbind("SUPER + SHIFT + B")

local main_mod = "SUPER"
local menu = "vicinae"
local file_manager = "strata"

-- Launchers.
o.bind("ALT + SPACE", "Omarchy menu", "omarchy-menu toggle")
o.rebind(main_mod .. " + SPACE", "Vicinae", menu .. " toggle")
o.rebind(main_mod .. " + SHIFT + F", "File manager", { launch = file_manager })
o.rebind(main_mod .. " + ALT + SHIFT + F", "File manager (cwd)",
  "uwsm-app -- " .. file_manager .. " \"$(omarchy-cmd-terminal-cwd)\"")
o.bind(main_mod .. " + E", "File manager", { launch = file_manager })
o.bind(main_mod .. " + B", "Browser", { omarchy = "browser" })
o.bind(main_mod .. " + M", "Music", { omarchy = "spotify" })

-- Vim-style focus.
o.bind(main_mod .. " + H", "Focus on left window", hl.dsp.focus({ direction = "l" }))
o.rebind(main_mod .. " + J", "Focus on below window", hl.dsp.focus({ direction = "d" }))
o.rebind(main_mod .. " + K", "Focus on above window", hl.dsp.focus({ direction = "u" }))
o.rebind(main_mod .. " + L", "Focus on right window", hl.dsp.focus({ direction = "r" }))

-- Vim-style window swap.
o.bind(main_mod .. " + SHIFT + H", "Swap window to the left", hl.dsp.window.swap({ direction = "l" }))
o.bind(main_mod .. " + SHIFT + J", "Swap window down", hl.dsp.window.swap({ direction = "d" }))
o.bind(main_mod .. " + SHIFT + K", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind(main_mod .. " + SHIFT + L", "Swap window to the right", hl.dsp.window.swap({ direction = "r" }))

-- Windows.
hl.unbind(main_mod .. " + W")
o.rebind(main_mod .. " + O", "Move window to next monitor", hl.dsp.window.move({ monitor = "+1" }))
o.bind(main_mod .. " + SHIFT + O", "Move workspace to next monitor", hl.dsp.workspace.move({ monitor = "+1" }))
o.bind(main_mod .. " + ALT + O", "Pop window out (float & pin)", "omarchy-hyprland-window-pop")

-- Cycle the focused column through scrolling:explicit_column_widths.
o.bind(main_mod .. " + R", "Cycle column width", hl.dsp.layout("colresize +conf"))
