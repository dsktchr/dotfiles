local wezterm = require("wezterm")

local M = {}

-- arg: wezterm.config_builder
function M.setup(config)
  config.font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font",
    "Hiragino Sans",
    -- "FiraCode Nerd Font",
  })

  config.font_size = 14
  config.audible_bell = "Disabled"
  config.tab_bar_at_bottom = true
  config.tab_max_width = 64
  config.enable_tab_bar = true
  config.command_palette_font_size = 18

  -- window
  config.window_padding = {
    left = 16,
    right = 16,
    bottom = 0,
    top = 16,
  }
  config.window_decorations = "RESIZE"
end

return M
