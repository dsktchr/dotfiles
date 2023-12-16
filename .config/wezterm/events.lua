local wezterm = require("wezterm")
local helper = require("helper")

local icons = {
  EDGE_LEFT = wezterm.nerdfonts.ple_left_half_circle_thick,
  EDGE_RIGHT = wezterm.nerdfonts.ple_right_half_circle_thick,
}

local colors = {
  CRUST = wezterm.color.parse("#181926"),
  BLUE = wezterm.color.parse("#8aadf4"),
}

wezterm.on('update-right-status', function(window, pane)
  local date = wezterm.strftime '%Y-%m-%d %H:%M:%S'

  -- Make it italic and underlined
  window:set_right_status(wezterm.format {
    { Attribute = { Underline = 'Single' } },
    { Attribute = { Italic = true } },
    { Text = 'Hello ' .. date },
  })
end)

wezterm.on(
  "format-tab-title",
  function(tab, tabs, pane, config, hover, maxWidth)
    local pane = tab.active_pane
    local title = helper.basename(pane.foreground_process_name)
    local icon = helper.get_prefer_icon(title)

    -- icons
    local EDGE_LEFT = icons.EDGE_LEFT
    local EDGE_RIGHT = icons.EDGE_RIGHT

    -- colors
    local CRUST = colors.CRUST
    local BLUE = colors.BLUE

    if tab.is_active then
      BLUE = BLUE:lighten(0.2)
    elseif hover then
    end

    return {
      { Background = { Color = CRUST } },
      { Foreground = { Color = BLUE } },
      { Text = EDGE_LEFT },
      { Background = { Color = BLUE } },
      { Foreground = { Color = CRUST } },
      { Text = ' ' .. icon .. ' ' .. title .. ' ' },
      { Background = { Color = CRUST } },
      { Foreground = { Color = BLUE } },
      { Text = EDGE_RIGHT },
    }
  end
)


return {}
