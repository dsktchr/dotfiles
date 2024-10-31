local wezterm = require("wezterm")
require("events")

local _ = require("setup")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.leader =  {
  key = "a",
  mods = "CTRL",
  timeout_milliseconds = 2000,
  colors = {
    compose_cursor = 'orange',
  },
}

_.setup(config)

return config
