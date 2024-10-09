return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      gofmt = "gofmt",
      max_line_len = 256,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", 'gomod' },
}
