vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.bo.filetype == "perl" then
      return
    end
    vim.lsp.buf.document_highlight()
  end
})

vim.api.nvim_create_autocmd({ "CursorMoved" }, {
  callback = function()
    if vim.bo.filetype == "perl" then
      return
    end
    vim.lsp.buf.clear_references()
  end
})
