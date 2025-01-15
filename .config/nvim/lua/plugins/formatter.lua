return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    local conform = require("conform")
    conform.setup({
      formatter_by_ft = {
        lua = { "stylua" },
        typescript = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })

    -- vim.api.nvim_create_autocmd("BufWritePre", {
    -- 	pattern = "*",
    -- 	callback = function(args)
    -- 		require("conform").format({ bufnr = args.buf })
    -- 	end,
    -- })
  end,
}
