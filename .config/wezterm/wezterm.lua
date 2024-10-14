local wezterm = require("wezterm")
local colors = require("colors")
local keys = require("keymaps").keys
local key_tables = require("keymaps").key_tables
require("events")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

colors.setup(config)

config.leader =  { key = "a",  mods = "CTRL", timeout_milliseconds = 2000, colors = {
  compose_cursor = 'orange',
}, }
config.keys = keys
config.key_tables = key_tables

config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMono Nerd Font", weight = "Regular", stretch = "Normal", style = "Normal" },
  -- { family = "FiraCode Nerd Font", weight = "Regular", stretch = "Normal", style = "Normal" },
})

config.font_size = 16
config.audible_bell = "Disabled"
config.tab_bar_at_bottom = true
config.tab_max_width = 64

return config
