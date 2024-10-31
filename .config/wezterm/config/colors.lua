local wezterm = require("wezterm")

local M = {}

function M.setup(config)
	local theme = "Sonokai (Gogh)"
  local scheme = wezterm.color.get_builtin_schemes()[theme]

  config.color_schemes = { [theme] = scheme }
  config.color_scheme = theme
  config.window_background_opacity = 1
  config.macos_window_background_blur = nil
end

return M
