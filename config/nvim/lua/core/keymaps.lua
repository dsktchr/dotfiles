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

vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  else
    return "<Tab>"
  end
end, { expr = true, noremap = true });


vim.keymap.set("i", "<S-Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  else
    return "<Tab>"
  end
end, { expr = true, noremap = true });


local keycode = vim.keycode or function(x)
  return vim.api.nvim_replace_termcodes(x, true, true, true)
end

local keys = {
  ['cr']        = keycode('<CR>'),
  ['ctrl-y']    = keycode('<C-y>'),
  ['ctrl-y_cr'] = keycode('<C-y><CR>'),
}

_G.cr_action = function()
  if vim.fn.pumvisible() ~= 0 then
    -- 補完ポップアップが表示されている場合：
    -- 項目が選択されていれば <C-y>（確定）、選択されていなければ <C-y><CR>（確定して改行）
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
  else
    -- 補完ポップアップが表示されていない場合は普通の改行
    return keys['cr']
  end
end

vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', { expr = true })
