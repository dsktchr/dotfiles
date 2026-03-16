local function copy_to_clipboard(content)
  vim.fn.setreg("+", content)
end

vim.api.nvim_create_user_command(
  "XFilePath",
  function (opts)
    copy_to_clipboard(vim.fn.expand("%:~:."))
  end,
  { desc = "Copy relative file path"}
)

vim.api.nvim_create_user_command(
  "XDirPath",
  function (opts)
    copy_to_clipboard(vim.fn.expand("%:~:.:h"))
  end,
  { desc = "Copy relative dir path"}
)



