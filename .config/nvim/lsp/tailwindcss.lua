return {
  settings = {
    tailwindCSS = {
      experimental = {
        emmetCompletions = false,
        configFile = "tailwind.config.js",
        -- clsx support
        classRegex = { "clsx\\(.*?\\)(?!\\])", }
      }
    }
  }
}
