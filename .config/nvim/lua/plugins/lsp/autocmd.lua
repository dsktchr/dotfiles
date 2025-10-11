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

-- Hide Copilot suggestion when BlinkCmp menu is open
vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuOpen",
  callback = function()
    vim.b.copilot_suggestion_hidden = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuClose",
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})

