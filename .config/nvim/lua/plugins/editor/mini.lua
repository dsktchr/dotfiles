return {
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
      require("mini.align").setup()
    end,
  },
}
