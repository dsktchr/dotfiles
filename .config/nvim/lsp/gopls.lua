return {
  settings = {
    gopls = {
      buildFlags = { "-tags=test" },
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true
      },
      staticcheck = true
    }
  }
}
