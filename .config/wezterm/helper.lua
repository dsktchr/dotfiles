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

function helper.get_user_workspace()
  local home_dir = wezterm.home_dir
  local workspace_dir = home_dir .. "/Projects"

  local dirs = wezterm.read_dir(workspace_dir)

  local label_list = {}
  for _, v in ipairs(dirs) do
    local n, _ = helper.basename(v)
    if n ~= ".DS_Store" then
      table.insert(label_list, n)
    end
  end

  table.sort(label_list)

  local workspace = {}
  for _, label in ipairs(label_list) do
    table.insert(workspace, { id = workspace_dir .. "/" .. label, label = label })
  end

  table.insert(workspace, 1, { id = home_dir .. "/dotfiles", label = "dotfiles"})

  return workspace
end

return helper
