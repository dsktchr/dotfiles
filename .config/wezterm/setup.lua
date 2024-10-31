local wezterm = require("wezterm")
local helper = require("helper")

local M = {}

-- local 専用の setup をする
function M.setup(wezterm_config)
  local core_dir  = wezterm.config_dir .. "/" .. "config"
  for _, value in ipairs(wezterm.read_dir(core_dir)) do
    local name, _ = helper.basename(value)
    local module_name = string.match(name, "(%w+).lua")

    if module_name ~= "setup" then
      local ok, local_config = pcall(require, "config." .. module_name)
      if ok then
        local_config.setup(wezterm_config)
      end
    end
  end
end

return M
