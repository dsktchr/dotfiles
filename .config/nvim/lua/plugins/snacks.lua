return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    enabled = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true, tree = false, },
      indent = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
        layouts = {
          default = {
            layout = {
              backdrop = false,
              width = 0.8,
              min_width = 80,
              height = 0.8,
              min_height = 30,
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "preview", title = "{preview}", height = 0.4,  border = "bottom" },
              { win = "list",    border = "none" },
              { win = "input",   height = 1,          border = "top" },
            }
          }
        },
        explorer = {
          tree = false,
        }
      },
      notifier = { enabled = false },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      -- Find
      { "<leader>bf", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
      { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
      { "<leader>fg", function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
      { "<leader>fp", function() Snacks.picker.projects() end,                                desc = "Projects" },
      { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent" },

      -- Explorer
      {
        "<leader>fb", function() Snacks.picker.explorer({ tree = false }) end, desc = "ファイルブラウザを開く" },
      -- Grep
      { "<leader>sb", function() Snacks.picker.lines() end,        desc = "Buffer Lines" },
      { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<leader>sg", function() Snacks.picker.grep() end,         desc = "Grep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end,    desc = "Visual selection or word", mode = { "n", "x" } },

      -- git
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl", function() Snacks.picker.git_log() end,      desc = "Git Log" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs", function() Snacks.picker.git_status() end,   desc = "Git Status" },
      { "<leader>gS", function() Snacks.picker.git_stash() end,    desc = "Git Stash" },
      { "<leader>gd", function() Snacks.picker.git_diff() end,     desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    },
  },
}
