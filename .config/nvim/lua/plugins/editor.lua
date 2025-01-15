return {
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

      vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Move Prev Buffer" })
      vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Move Next Buffer" })
    end,
  },
  -- mini plugins
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.pairs").setup()
      require("mini.move").setup(
        {
          mappings = {
            left = '<M-h>',
            right = '<M-l>',
            down = '<M-j>',
            up = '<M-k>',

            -- Move current line in Normal mode
            line_left = '<M-h>',
            line_right = '<M-l>',
            line_down = '<M-j>',
            line_up = '<M-k>',
          },

          -- Options which control moving behavior
          options = {
            -- Automatically reindent selection during linewise vertical move
            reindent_linewise = true,
          },
        })
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
