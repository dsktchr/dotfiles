local in_japanese = "説明は日本語でお願いします."

return {
  {
    "folke/sidekick.nvim",
    opts = {
      -- 全て日本語となるようにする
      prompts = {
        changes         = "現在の変更点を要約してください。",
        diagnostics     = "{file}ファイルのdiagnosticsに対して対応するべき修正を教えてください。\n{diagnostics}",
        diagnostics_all = "全てのdiagnosticsに対して対応するべき修正を教えてください。\n{diagnostics_all}",
        document        = "{position}に対するコメントを追加してください。",
        explain         = "{this}に対する説明をしてください。",
        fix             = "{this}に対する修正をしてください。",
        optimize        = "{this}に対して最適化をしてください。",
        review          = "{file}ファイルのコードレビューをしてください。",
        tests           = "{this}に対するテストコードを生成してください。",
      },
      -- add any options here
      cli = {
        mux = {
          backend = "zellij",
          enabled = false,
        },
      },
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<leader>aa",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function() require("sidekick.cli").select() end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>at",
        function() require("sidekick.cli").send({ msg = "{this}" }) end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>av",
        function() require("sidekick.cli").send({ msg = "{selection}" }) end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      {
        "<c-.>",
        function() require("sidekick.cli").focus() end,
        mode = { "n", "x", "i", "t" },
        desc = "Sidekick Switch Focus",
      },
      -- Example of a keybinding to open Claude directly
      {
        "<leader>ac",
        function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
        desc = "Sidekick Toggle Claude",
      },
    },
  },
  { 
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = vim.env.VOLTA_HOME .. "/tools/image/node/24.9.0/bin/node",
      server_opts_overrides = {
        trace = "verbose",
        cmd = {
          vim.fn.expand("~/.local/share/nvim/mason/bin/copilot-language-server"),
          "--stdio",
        },
        settings = {
          advanced = {
            listCount = 10, -- #completions for panel
            inlineSuggestCount = 3, -- #completions for getCompletions
          }
        },
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "zbirenbaum/copilot.lua" },
    },
    enabled = false,
    build = "make tiktoken",
    opts = {
      model = "gpt-5-codex",
      debug = false,
      window = {
        layout = "float",
      },
      prompts = {
        Explain = {
          mapping = "<leader>ae",
          description = "選択範囲を説明" .. in_japanese,
        },
        Review = {
          mapping = "<leader>ar",
          description = "選択範囲をレビュー." .. in_japanese,
        },
        Fix = {
          mapping = "<leader>af",
          description = "選択範囲を修正." .. in_japanese,
        },
        Optimize = {
          mapping = "<leader>ao",
          description = "選択範囲の最適化." .. in_japanese,
        },
        Docs = {
          mapping = "<leader>ad",
          description = "選択範囲のドキュメントを生成." .. in_japanese,
        },
        Tests = {
          mapping = "<leader>at",
          description = "選択範囲のテストを生成." .. in_japanese,
        },
        Commit = {
          mapping = "<leader>ac",
          description = "選択範囲のコミットメッセージを生成." .. in_japanese,
        },
      },
    },
  }
}

