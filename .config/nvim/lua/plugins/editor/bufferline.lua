return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
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
}
