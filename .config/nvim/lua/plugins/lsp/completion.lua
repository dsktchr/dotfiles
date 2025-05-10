return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
    },
    -- use a release tag to download pre-built binaries
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = 'none',

        -- select DOWN
        ['<Tab>'] = { 'select_next', 'snippet_forward', },
        ['<C-j>'] = { 'select_next' },

        -- select UP
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward' },
        ['<C-k>'] = { 'select_prev' },

        -- show menu
        ['<C-space>'] = { "show" },

        -- accept
        ['<CR>'] = { 'select_and_accept', 'fallback' },
      },

      appearance = { nerd_font_variant = 'mono' },

      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500, },
        list = { selection = { preselect = false, auto_insert = false, } },
      },

      snippets = { preset = "luasnip" },

      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },

    },
    opts_extend = { "sources.default" },
    config = function(_, opts)
      require("blink.cmp").setup(opts)
    end
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    config = function()
      require("luasnip").setup();
      require("luasnip.loaders.from_vscode").lazy_load();
    end
  }
}
