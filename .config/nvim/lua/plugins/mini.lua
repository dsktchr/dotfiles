return {
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
}
