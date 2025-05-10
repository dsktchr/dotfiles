return {
  {

    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      'saghen/blink.cmp',
    },
    config = function()
      require("plugins.lsp.autocmd")
      require("plugins.lsp.servers")
      require("plugins.lsp.events")
    end
  },
  { import = "plugins.lsp.completion" },
  { import = "plugins.lsp.lspsaga" },
  { import = "plugins.lsp.formatter" },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function() require 'lsp_signature'.setup() end
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
