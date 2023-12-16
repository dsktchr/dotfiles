return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "macchiato",
    integrations = {
      cmp = true,
      treesitter = true,
      gitsigns = true,
      lsp_saga = true,
      telescope = {
        enabled = true,
        style = "nvchad"
      }
    }
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end
}
