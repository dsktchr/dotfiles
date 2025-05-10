local ensure_insalled = {
  "rust_analyzer",
  "ts_ls",
  "cssls",
  "tailwindcss",
  "html",
  -- "lua_ls",
  "eslint",
  "perlnavigator",
  "gopls",
  "yamlls",
  "pyright",
}

require("mason").setup()
require("mason-lspconfig").setup()

vim.lsp.enable(ensure_insalled)
