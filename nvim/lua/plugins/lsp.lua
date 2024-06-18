vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local map = vim.keymap.set
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    map("n", "<leader>e", ":Lspsaga show_buf_diagnostics<CR>")
    map("n", "[d", ":Lspsaga diagnostic_jump_next<CR>")
    map("n", "]d", ":Lspsaga diagnostic_jump_prev<CR>")
    map("n", "<leader>q", vim.diagnostic.setloclist)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gd", ":Lspsaga goto_definition<CR>", opts)
    map("n", "K", ":Lspsaga hover_doc<CR>", opts)
    map("n", "gi", ":Lspsaga finder imp<CR>", opts)
    map("n", "<leader>k", vim.lsp.buf.signature_help, opts)
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    map("n", "<leader>D", ":Lspsaga peek_type_definition<CR>", opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<CR>", opts)
    map("n", "gr", ":Lspsaga finder<CR>", opts)
  end,
})

return {
  {
    "folke/neodev.nvim",
    opts = {},
  },
  -- completionを有効にするために、最初に読み込ませる
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      servers = {
        rust_analyzer = { settings = {}},
        tsserver = { settings = {} },
        cssls = { settings = {} },
        tailwindcss = { settings = {} },
        html = { settings = {} },
        lua_ls = {
          settings = {
            Lua = {
              format = {
                enable = true,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                },
              },
              completion = {
                callSnippet = "Replace"
              }
            }
          }
        },
        eslint = { settings = {} },
        perlnavigator = { settings = {} },
        gopls = {
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
              analyses = {
                unusedparams = true
              },
              staticcheck = true
            }
          }
        },
        yamlls = {
          settings = {}
        }
        --"sqlls",
      },
    },
    config = function(_, opts)
     local neodev = require("neodev")
     neodev.setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })

      require("mason").setup({})
      require("mason-lspconfig").setup({ automatic_installation = true })

      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      for server, server_settings in pairs(servers) do
        local opts = vim.tbl_deep_extend("force", { capabilities = capabilities },
          server_settings)
        lspconfig[server].setup(opts)
      end
      vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
        callback = function()
          if vim.bo.filetype == "perl" then
            return
          end
          vim.lsp.buf.document_highlight()
        end
      })

      vim.api.nvim_create_autocmd({"CursorMoved"}, {
        callback = function()
          if vim.bo.filetype == "perl" then
            return
          end
          vim.lsp.buf.clear_references()
        end
      })
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup({
        ui = {
          border = "single",
          -- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
        },
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
}
