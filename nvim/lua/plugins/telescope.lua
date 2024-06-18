
local M = {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = {
    {
      "<Space>fb",
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      desc = "[F]ile [B]rowser"
    },
    {
      "<Space>fd",
      ":Telescope file_browser files=false<CR>",
      desc = "[F]older [B]rowser"
    },
    {
      "<Space>ff",
      ":lua require('telescope.builtin').find_files()<CR>",
      desc = "[F]ind [F]iles"
    },
    {
      "<Space>rr",
      ":lua require('telescope.builtin').live_grep()<CR>",
      desc = "Live G[R]ep"
    },
    {
      "<Space>bf",
      ":lua require('telescope.builtin').buffers()<CR>",
      desc = "[B]u[F]fers"
    },
    {
      "<Space>ht",
      ":lua require('telescope.builtin').help_tags()<CR>",
      desc = "[H]elp [T]ags"
    },
    {
      "<Space>gb",
      ":lua require('telescope.builtin').git_branches()<CR>",
      desc = "Show [G]it [B]ranches"
    },
    {
      "<Space>gs",
      ":lua require('telescope.builtin').git_status()<CR>",
      desc = "Show [G]it [S]tatus"
    },
    {
      "<Space>ch",
      ":lua require('telescope.builtin').command_history()<CR>",
      desc = "[C]ommand [H]istory"
    },
  }
}

local telescope_acionts = require("telescope.actions")
local previewers = require("telescope.previewers")

local _bad = { ".*[%.|bundle].*%.js" } -- Put all filetypes that slow you down in this array
local bad_files = function(filepath)
  for _, v in ipairs(_bad) do
    if filepath:match(v) then
      return false
    end
  end

  return true
end

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  if opts.use_ft_detect == nil then opts.use_ft_detect = true end
  opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
  previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

M.config = function(_, opts)
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      buffer_previewer_maker = new_maker,
      mappings = {
        i = {
          ["<C-j>"] = { telescope_acionts.move_selection_next, type = "action", opts = { nowait = true, silent = true } },
          ["<C-k>"] = { telescope_acionts.move_selection_previous, type = "action", opts = { nowait = true, silent = true } },
        },
        n = {
          ["<C-j>"] = { telescope_acionts.move_selection_next, type = "action", opts = { nowait = true, silent = true } },
          ["<C-k>"] = { telescope_acionts.move_selection_previous, type = "action", opts = { nowait = true, silent = true } },
        }
      }
    },
    extensions = {
      file_browser = {
        hijack_netrw = true,
      },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  })
  telescope.load_extension("fzf")
  telescope.load_extension("file_browser")
end

return M
