local wezterm = require("wezterm")

local module = {}

function module.setup(config)
  local theme = "Catppuccin Macchiato"
  local scheme = wezterm.color.get_builtin_schemes()[theme]
  scheme.cursor_fg = "#181926"
  scheme.cursor_bg = "#ed8796"


  config.color_schemes = { [theme] = scheme }
  config.color_scheme = theme
  config.command_palette_fg_color = "#cad3f5"
  config.command_palette_bg_color = "#363a4f"

end

return module
