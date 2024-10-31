return {
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     flavour = "macchiato",
  --     integrations = {
  --       cmp = true,
  --       treesitter = true,
  --       gitsigns = true,
  --       lsp_saga = true,
  --       telescope = {
  --         enabled = true,
  --         style = "nvchad"
  --       }
  --     }
  --   },
  --   config = function(_, opts)
  --     require("catppuccin").setup(opts)
  --     vim.cmd.colorscheme "catppuccin"
  --   end
  -- },
  -- -- {
  -- --   "mcchrish/zenbones.nvim",
  -- --   dependencies = {"rktjmp/lush.nvim"},
  -- --   priority = 1000,
  -- --   config = function ()
  -- --     vim.cmd.colorscheme "kanagawabones"
  -- --   end
  -- -- },
  -- -- colorizer
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.sonokai_enable_italic = true
      vim.cmd.colorscheme('sonokai')
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },
  -- indent
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup()
    end,
  },
  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function(_, opts)
      require("lualine").setup({
        options = { 
          globalstatus = true,
        },
      })
    end,
  },
  -- bufmanager
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      {
        "<S-Tab>",
        ":BufferLineCyclePrev<CR>",
        desc = "Move Prev Buffer",
      },
      {
        "<Tab>",
        ":BufferLineCycleNext<CR>",
        desc = "Move Next Buffer",
      },
    },
    config = function(_, _)
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          style_preset = {
            bufferline.style_preset.no_italic,
            bufferline.style_preset.no_bold,
          },
        }
      })
    end,
  },
  -- mini plugins
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.pairs").setup()
      require("mini.move").setup()
      require("mini.surround").setup({
        custom_surroundings = {
          [")"] = { output = { left = "(", right = ")" } },
          ["("] = { output = { left = "(", right = ")" } },
        },
      })
      require("mini.comment").setup()
      require("mini.sessions").setup()
      require("mini.align").setup()
    end,
  },
}
