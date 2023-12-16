return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {

  },
  config = function()
    require("lualine").setup({
      options = { theme = "catppuccin", globalstatus = true },
    })
  end,
}
