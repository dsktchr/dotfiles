local wezterm = require("wezterm")
local helper = require("../helper")

local M = {}

-- このファイルはbulk setupの際に無視すること
-- setup config/*.lua
M.setup = function()
  local config = {}

  if wezterm.config_builder then
    config = wezterm.config_builder()
  end

  -- リーダーkey を設定
  config.leader =  {
    key = "a",
    mods = "CTRL",
    timeout_milliseconds = 2000,
    colors = {
      compose_cursor = 'orange',
    },
  }

  local core_dir  = wezterm.config_dir .. "/" .. "config"
  for _, value in ipairs(wezterm.read_dir(core_dir)) do
    local name, _ = helper.basename(value)
    local module_name = string.match(name, "(%w+).lua")

    if module_name ~= "init" then
      local ok, m = pcall(require, "config." .. module_name)
      if ok then
        m.setup(config)
      end
    end
  end

  return config
end

return M
