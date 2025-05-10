vim.g.mapleader = " "

vim.opt.swapfile = false

-- global
local global_options = {
  { name = 'shiftwidth',    value = 0 },
  { name = 'softtabstop',   value = 2 },
  { name = 'tabstop',       value = 2 },
  { name = 'autoread',      value = true },
  { name = 'clipboard',     value = "unnamedplus,unnamed" },
  { name = 'hidden',        value = true },
  { name = 'hlsearch',      value = false },
  { name = 'laststatus',    value = 3 },
  { name = 'number',        value = true },
  { name = 'signcolumn',    value = "yes" },
  { name = 'termguicolors', value = true },
  { name = 'list',          value = true },
  { name = "listchars",     value = "tab:»-,precedes:«,space:･" },
  { name = "helplang",      value = "ja,en" },
  { name = 'expandtab',     value = true },
  { name = 'updatetime',    value = 500 },
  { name = 'ignorecase',    value = true },
  { name = 'smartcase',     value = true },
}
for _, opts in ipairs(global_options) do
  vim.api.nvim_set_option_value(opts.name, opts.value, { scope = "global" })
end

-- local
local local_options = {
  { name = 'cursorline', value = true },
}
for _, opts in ipairs(local_options) do
  vim.api.nvim_set_option_value(opts.name, opts.value, { scope = "local" })
end
