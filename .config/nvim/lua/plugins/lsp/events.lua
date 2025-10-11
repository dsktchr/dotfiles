local map = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp/config", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client ~= nil then
      local opts = { buffer = ev.buf }
      map("n", "<leader>e", "<cmd>Lspsaga show_buf_diagnostics<CR>")
      map("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
      map("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
      map("n", "<leader>q", vim.diagnostic.setloclist)
      -- map("n", "gD", vim.lsp.buf.definition, opts)
      map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "gi", vim.lsp.buf.implementation, opts)
      map("n", "<leader>k", vim.lsp.buf.signature_help, opts)
      map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      map("n", "<leader>D", "<cmd>Lspsaga peek_type_definition<CR>", opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
    end
  end,
})
