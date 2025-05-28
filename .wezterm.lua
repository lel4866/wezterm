-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font_with_fallback({ {family="Hack Nerd Font"} })
config.font_size = 9
config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.95
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 10000
config.default_workspace = "home"

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.5
}

-- Keys
config.leader = {key='`', timeout_milliseconds=1000}

config.keys = {
  { key='v', mods='LEADER', action=act.SplitHorizontal {domain='CurrentPaneDomain'}, },
  { key='s', mods='LEADER', action=act.SplitVertical {domain='CurrentPaneDomain'}, },
  { key='h', mods='LEADER', action=act.ActivatePaneDirection("Left") },
  { key='j', mods='LEADER', action=act.ActivatePaneDirection("Down") },
  { key='k', mods='LEADER', action=act.ActivatePaneDirection("Up") },
  { key='l', mods='LEADER', action=act.ActivatePaneDirection("Right") },
  { key='q', mods='LEADER', action=act.CloseCurrentPane {confirm=false}, },
  { key='x', mods='LEADER', action=act.TogglePaneZoomState },
  { key='p', mods='LEADER', action=act.PaneSelect {mode="Activate"}, },

  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  { key='a', mods='LEADER|CTRL', action=act.SendKey { key='a', mods='CTRL' }, },
}
return config