return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({})
    vim.keymap.set('n', "<Space>tt", ":ToggleTerm direction=tab<CR>",
      { silent = true, noremap = true, desc = "[T]oggle [T]erm" })
  end,
}
