return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function(_, opts)
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map('n', '<Space>hs', gs.stage_hunk)
          map('n', '<Space>hr', gs.reset_hunk)
          map('v', '<Space>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
          map('v', '<Space>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
          map('n', '<Space>hS', gs.stage_buffer)
          map('n', '<Space>hu', gs.undo_stage_hunk)
          map('n', '<Space>hR', gs.reset_buffer)
          map('n', '<Space>hp', gs.preview_hunk)
          map('n', '<Space>hb', function() gs.blame_line { full = true } end)
          map('n', '<Space>tb', gs.toggle_current_line_blame)
          map('n', '<Space>hd', gs.diffthis)
          map('n', '<Space>hD', function() gs.diffthis('~') end)
          map('n', '<Space>td', gs.toggle_deleted)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end,
  },
}
