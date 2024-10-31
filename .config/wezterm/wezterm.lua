local wezterm = require("wezterm")
local m = require("setup")
require("events")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.leader =  { key = "a",  mods = "CTRL", timeout_milliseconds = 2000, colors = {
  compose_cursor = 'orange',
},}

config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMono Nerd Font", weight = "Regular", stretch = "Normal", style = "Normal" },
  -- { family = "FiraCode Nerd Font", weight = "Regular", stretch = "Normal", style = "Normal" },
})

config.font_size = 16
config.audible_bell = "Disabled"
config.tab_bar_at_bottom = true
config.tab_max_width = 64


m.setup(config)

return config
