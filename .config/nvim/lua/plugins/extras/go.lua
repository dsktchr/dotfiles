return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      max_line_len = 256,
      gofmt = "gofmt",
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", 'gomod' },
}
