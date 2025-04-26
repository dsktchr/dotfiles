return {
  settings = {
    tailwindCSS = {
      experimental = {
        configFile = "tailwind.config.js",
        -- clsx support
        classRegex = { "clsx\\(.*?\\)(?!\\])", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" },
      }
    }
  }

}
