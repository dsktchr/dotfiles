local map = vim.keymap.set

local opts = { silent = true, noremap = true }
--[[
don't call recordings !!
it couses sometimes any LSP features to block. (i.e completion)
]]
map("n", "q", "<Nop>", opts)
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
map("n", "-", ":horizontal res -3<CR>", opts)
map("n", "+", ":horizontal res +3<CR>", opts)
map("n", "<C-<>", "<C-w><", opts)
map("n", "<C->>", "<C-w>>", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Terminal
map("t", "<Esc>", [[<C-\><C-n>]], opts)
