--[[
########### Custome Commands #############
--]]
-- get current file path from `root` (/.git)
vim.api.nvim_create_user_command(
  "XFilePath",
  function(opts)
    local Path = require("plenary.path")
    local git_dir
    local bufname = vim.api.nvim_buf_get_name(0)
    -- TODO: $HOME までにしないと無限に遡られる
    for dir in vim.fs.parents(bufname) do
      if vim.fn.isdirectory(dir .. "/.git") == 1 then
        git_dir = dir
        break
      end
    end
    if git_dir then
      local p = Path:new { bufname, sep = "/" }
      local pj_path = Path:new(p.filename):make_relative(git_dir)
      pj_path = Path:new("."):joinpath(pj_path).filename
      vim.fn['setreg']('*', pj_path)
    end
  end,
  {
    -- nargs = "?",
    -- complete = function(ArgLead, CmdLine, CursorPos)
    --   return { "relative" }
    -- end,
  }
)

--[[
########### System Commands ###########
--]]
-- format go src
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = format_sync_grp,
  pattern = "*.go",
  callback = function()
  -- TODO: pluginのimportが完了しているかチェックする必要があるかも
   require('go.format').gofmt()
  end,
})
