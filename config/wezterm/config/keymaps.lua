local wezterm = require("wezterm")
local act = wezterm.action

local helper = require("helper")

local M = {}

local KEYS = {
    -- ActivateKeyTable
    {
      key = 'r',
      mods = 'LEADER',
      action = act.ActivateKeyTable {
        name = 'resize_pane',
        one_shot = false,
        timeout_milliseconds = 1000,
      }
    },
    {
      key = 'a',
      mods = 'LEADER',
      action = act.ActivateKeyTable {
        name = 'activate_pane',
        one_shot = false,
        timeout_milliseconds = 1000,
      }
    },
    -- Workspace
    {
      key = 's',
      mods = 'LEADER',
      action = wezterm.action_callback(function(window, pane)
        window:perform_action(
          act.InputSelector({
            title = "Choose Workspace",
            fuzzy = false,
            choices = helper.get_user_workspace(),
            action = wezterm.action_callback(
              function(w, p, id, label)
                if id then
                  window:perform_action(
                    act.SwitchToWorkspace(
                      {
                        name = label,
                        spawn = { label = "Workspace: " .. label, cwd = id },
                      }
                    ),
                    p
                  )
                end
              end
            ),
          }), pane)
      end),
    },
    -- Command Pallete
    { key = 'P',     mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },

    -- Activate Copy Mode
    { key = 'X',     mods = 'CTRL',     action = act.ActivateCopyMode },
    -- Activate QuickSelect Mode
    { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
    -- fullscreen mode
    { key = 'Enter', mods = 'LEADER',     action = act.ToggleFullScreen },

    { key = '-',     mods = 'LEADER',     action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = "\\",    mods = 'LEADER',     action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },

    { key = 'Tab',   mods = 'CTRL',       action = act.ActivateTabRelative(1) },
    { key = 'Tab',   mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
    {
      key = 'w',
      mods = "CMD",
      action = act.CloseCurrentPane { confirm = true },
    },
    { key = 'C',     mods = 'CTRL',       action = act.CopyTo 'Clipboard' },
    { key = 'C',     mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    { key = 'F',     mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },

    { key = 'K',     mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },

    { key = 'N',     mods = 'SHIFT|CTRL', action = act.SpawnWindow },

    { key = 'u',     mods = 'SHIFT|CTRL', action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
    { key = 't',     mods = 'LEADER',     action = act.ShowTabNavigator },

    { key = '=',     mods = 'CTRL',       action = act.IncreaseFontSize },
    { key = '-',     mods = 'CTRL',       action = act.DecreaseFontSize },
    { key = 'c',     mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },

    { key = 'l',     mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },

    { key = 'u',     mods = 'SHIFT|CTRL', action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
    { key = 'v',     mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },

    { key = 'Copy',  mods = 'NONE',       action = act.CopyTo 'Clipboard' },
    { key = 'Paste', mods = 'NONE',       action = act.PasteFrom 'Clipboard' },
}

local RESIZE_PANE = {
    {
      key = 'LeftArrow',
      action = act.AdjustPaneSize { 'Left', 1 },
    },
    {
      key = 'h',
      action = act.AdjustPaneSize { 'Left', 1 },
    },
    {
      key = 'DownArrow',
      action = act.AdjustPaneSize { 'Down', 1 },
    },
    {
      key = 'j',
      action = act.AdjustPaneSize { 'Down', 1 },
    },
    {
      key = 'UpArrow',
      action = act.AdjustPaneSize { 'Up', 1 },
    },
    {
      key = 'k',
      action = act.AdjustPaneSize { 'Up', 1 },
    },
    {
      key = 'RightArrow',
      action = act.AdjustPaneSize { 'Right', 1 },
    },
    {
      key = 'l',
      action = act.AdjustPaneSize { 'Right', 1 },
    },
    {
      key = 'Escape',
      action = "PopKeyTable",
    },
}


local ACTIVATE_PANE = {
    {
      key = 'LeftArrow',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'h',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'DownArrow',
      action = act.ActivatePaneDirection 'Down',
    },
    {
      key = 'j',
      action = act.ActivatePaneDirection 'Down',
    },
    {
      key = 'UpArrow',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'k',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'RightArrow',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'l',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'Escape',
      action = "PopKeyTable",
    },
}

local COPY_MODE = {
    {
      key = 'Tab',
      mods = 'NONE',
      action = act.CopyMode 'MoveForwardWord'
    },
    { key = 'Tab',    mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'Enter',  mods = 'NONE',  action = act.CopyMode 'MoveToStartOfNextLine' },
    { key = 'Escape', mods = 'NONE',  action = act.CopyMode 'Close' },
    { key = 'Space',  mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = '$',      mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '$',      mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '0',      mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
    { key = 'F',      mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = 'F',      mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = 'G',      mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'G',      mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'T',      mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = 'T',      mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = 'V',      mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = 'V',      mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = '^',      mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = '^',      mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'b',      mods = 'NONE',  action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b',      mods = 'ALT',   action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b',      mods = 'CTRL',  action = act.CopyMode 'PageUp' },
    { key = 'c',      mods = 'CTRL',  action = act.CopyMode 'Close' },
    { key = 'd',      mods = 'CTRL',  action = act.CopyMode { MoveByPage = (0.5) } },
    { key = 'e',      mods = 'NONE',  action = act.CopyMode 'MoveForwardWordEnd' },
    { key = 'f',      mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = false } } },
    { key = 'f',      mods = 'ALT',   action = act.CopyMode 'MoveForwardWord' },
    { key = 'g',      mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackTop' },
    { key = 'h',      mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
    { key = 'j',      mods = 'NONE',  action = act.CopyMode 'MoveDown' },
    { key = 'k',      mods = 'NONE',  action = act.CopyMode 'MoveUp' },
    { key = 'l',      mods = 'NONE',  action = act.CopyMode 'MoveRight' },
    { key = 'q',      mods = 'NONE',  action = act.CopyMode 'Close' },
    { key = 't',      mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = true } } },
    { key = 'u',      mods = 'CTRL',  action = act.CopyMode { MoveByPage = (-0.5) } },
    { key = 'v',      mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'v',      mods = 'CTRL',  action = act.CopyMode { SetSelectionMode = 'Block' } },
    { key = 'w',      mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
    { key = 'y',      mods = 'NONE',  action = act.Multiple { { CopyTo = 'ClipboardAndPrimarySelection' }, { CopyMode = 'Close' } } },
}

local SEARCH_MODE = {
    {
      key = 'Enter',
      mods = 'NONE',
      action = act.CopyMode 'PriorMatch',
    },
    {
      key = 'Escape',
      mods = 'NONE',
      action = act.CopyMode 'Close',
    },
    {
      key = 'n',
      mods = 'CTRL',
      action = act.CopyMode 'NextMatch',
    },
    {
      key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch'
    },
    { key = 'r',         mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
    { key = 'u',         mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
    { key = 'PageUp',    mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
    { key = 'PageDown',  mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
    { key = 'UpArrow',   mods = 'NONE', action = act.CopyMode 'PriorMatch' },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
}

function M.setup(config)
  config.keys = KEYS

  config.key_tables = {
    resize_pane   = RESIZE_PANE,
    activate_pane = ACTIVATE_PANE,
    copy_mode     = COPY_MODE,
    search_mode   = SEARCH_MODE,
  }
end

return M
