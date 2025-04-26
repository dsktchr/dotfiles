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
require("mason-lspconfig").setup(
  { automatic_installation = true, ensure_installed = ensure_insalled }
)

-- capabilities の設定は既存のプラグインのデフォルトを利用する
-- @see https://github.com/hrsh7th/cmp-nvim-lsp
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config(
  "*",
  {
    capabilities = capabilities,
  }
)

vim.lsp.enable(ensure_insalled)
