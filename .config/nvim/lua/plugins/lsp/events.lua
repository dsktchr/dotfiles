local map = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp/config", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client ~= nil then
      -- vim.bo[ev.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

      if client:supports_method("textDocument/implementation") then
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

        map("i", "<c-space>", function()
          vim.lsp.completion.get()
        end)
      end

      if client:supports_method("textDocument/completion") then
        vim.lsp.completion.enable(true, client.id, ev.buf,
          {
            autotrigger = true,
            convert = function(item)
              return { abbr = item.label:gsub('%b()', '') }
            end,
          }
        )
      end
    end
  end,
})
