return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "css",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "perl",
        "perl",
        "ruby",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "yaml",
      },
      sync_install = false,
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = {
        enable = true,
        enable_rename = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
