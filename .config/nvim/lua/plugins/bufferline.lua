return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    {
      "<C-,>",
      ":BufferLineCyclePrev<CR>",
      desc = "Move Prev Buffer",
    },
    {
      "<C-.>",
      ":BufferLineCycleNext<CR>",
      desc = "Move Next Buffer",
    },
  },
  config = function(_, opts)
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        style_preset = {
          bufferline.style_preset.no_italic,
          bufferline.style_preset.no_bold,
        },
        separator_style = "slant",
      }
    })
  end,
}
