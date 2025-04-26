local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local M = {}

local function load_config()
  local confpath = vim.fn.stdpath("config") .. "/lua/core"

  local conffiles = vim.fs.find(
    function(name, _)
      return name:match(".*%.lua")
    end,
    { limit = math.huge, path = confpath, type = "file" }
  )

  for _, filepath in pairs(conffiles) do
    local _, _, modname = string.find(filepath, "core/(.*)%.lua")
    if not modname ~= "lazy" then
      local ok, msg = pcall(require, "core/" .. modname)
      if not ok then
        print("config load err: " .. msg)
      end
    end
  end
end


function M.setup()
  load_config()
  require("lazy").setup({
    spec = {
      { import = "plugins" },
      { import = "plugins.lsp.init" },
      { import = "plugins.editor.init" },
      { import = "plugins.extras.go" },
      { "vim-jp/vimdoc-ja" },
      { "nvim-lua/plenary.nvim",       lazy = true },
      { "nvim-tree/nvim-web-devicons", lazy = true }
    }
  })
end

return M
