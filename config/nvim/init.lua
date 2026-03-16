-- require("core/lazy").setup()


local mini_path = vim.fn.stdpath('data') .. '/site/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local origin = 'https://github.com/nvim-mini/mini.nvim'
  local clone_cmd = { 'git', 'clone', '--filter=blob:none', origin, mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end


require('mini.deps').setup()

_G.Config = {}

local gr = vim.api.nvim_create_augroup('custom-config', {})
Config.new_autocmd = function(event, pattern, callback, desc)
  local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

local align_blame = function(au_data)
  if au_data.data.git_subcommand ~= 'blame' then return end

  -- Align blame output with source
  local win_src = au_data.data.win_source
  vim.wo.wrap = false
  vim.fn.winrestview({ topline = vim.fn.line('w0', win_src) })
  vim.api.nvim_win_set_cursor(0, { vim.fn.line('.', win_src), 0 })

  -- Bind both windows so that they scroll together
  vim.wo[win_src].scrollbind, vim.wo.scrollbind = true, true
end

local au_opts = { pattern = 'MiniGitCommandSplit', callback = align_blame }
vim.api.nvim_create_autocmd('User', au_opts)

-- Some plugins and 'mini.nvim' modules only need setup during startup if Neovim
-- is started like `nvim -- path/to/file`, otherwise delaying setup is fine
Config.now_if_args = vim.fn.argc(-1) > 0 and MiniDeps.now or MiniDeps.later

