-- ▗▖  ▗▖ ▗▄▖ ▗▖  ▗▖▗▄▄▄▖▗▄▄▄▖▗▄▖ ▗▄▄▖  ▗▄▄▖
-- ▐▛▚▞▜▌▐▌ ▐▌▐▛▚▖▐▌  █    █ ▐▌ ▐▌▐▌ ▐▌▐▌
-- ▐▌  ▐▌▐▌ ▐▌▐▌ ▝▜▌  █    █ ▐▌ ▐▌▐▛▀▚▖ ▝▀▚▖
-- ▐▌  ▐▌▝▚▄▞▘▐▌  ▐▌▗▄█▄▖  █ ▝▚▄▞▘▐▌ ▐▌▗▄▄▞▘

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 1.67

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

local desk_monitor = "desc:Samsung Electric Company S27C900P"
local docked = hl.get_monitor(desk_monitor) ~= nil

-- Laptop scale: 2 while docked, 1.67 undocked. Kept as an expression so Omarchy's
-- clamshell script doesn't force a scale parsed from the line below.
local function laptop_scale(is_docked)
  return is_docked and 2 or 1.67
end

-- Laptop screen on the left (keep on one line: Omarchy's clamshell script parses it).
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = laptop_scale(docked) })

-- Samsung desk monitor on the right.
hl.monitor({ output = desk_monitor, mode = "preferred", position = "auto", scale = 2 })

-- Re-apply the laptop scale on dock/undock, unless the panel is off (lid closed).
local function apply_laptop_scale(is_docked)
  if hl.get_monitor("eDP-1") then
    hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = laptop_scale(is_docked) })
  end
end

-- Workspaces that belong to the desk monitor while it's connected.
local desk_workspaces = { "1", "2", "3", "4", "5" }

local function is_desk_monitor(monitor)
  return monitor.description:find(desk_monitor:sub(#"desc:" + 1), 1, true) == 1
end

-- Bind them only while docked (always-on rules make the laptop skip them when undocked).
local desk_rules = {}
for _, workspace in ipairs(desk_workspaces) do
  table.insert(desk_rules, hl.workspace_rule({ workspace = workspace, monitor = desk_monitor, enabled = docked }))
end

local function set_desk_rules(enabled)
  for _, rule in ipairs(desk_rules) do
    rule:set_enabled(enabled)
  end
end

-- On dock, move the desk workspaces to the desk monitor and focus workspace 1.
hl.on("monitor.added", function(monitor)
  if not is_desk_monitor(monitor) then
    return
  end

  set_desk_rules(true)
  apply_laptop_scale(true)
  for _, workspace in ipairs(desk_workspaces) do
    local ws = hl.get_workspace(workspace)
    if ws and ws.monitor and ws.monitor.id ~= monitor.id then
      hl.dispatch(hl.dsp.workspace.move({ workspace = workspace, monitor = desk_monitor }))
    end
  end
  hl.dispatch(hl.dsp.focus({ workspace = desk_workspaces[1] }))
end)

-- On undock, Hyprland moves the workspaces to the laptop; just release the rules.
hl.on("monitor.removed", function(monitor)
  if is_desk_monitor(monitor) then
    set_desk_rules(false)
    apply_laptop_scale(false)
  end
end)

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
