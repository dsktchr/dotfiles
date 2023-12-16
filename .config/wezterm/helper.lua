local wezterm = require("wezterm")
local nerdfonts = wezterm.nerdfonts

local helper = {}

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
function helper.basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end


--[[
######### Process Icons #########
--]]
-- プロセスに応じたアイコンのtable
local process_icons = {
  docker = nerdfonts.linux_docker,
  node = nerdfonts.md_nodejs,
  nvim = nerdfonts.dev_vim,
  ssh = nerdfonts.md_ssh,
  default = nerdfonts.cod_terminal_bash,
}

function helper.get_prefer_icon(title)
  local icon = process_icons[title]
  if not icon or #icon == 0 then
    return process_icons.default
  end
  return icon
end
--[[
######### Process Icons #########
--]]

return helper
