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

-- Update status
-- Left stat
--   Display Werterm Mode
-- Right status
--   Display CWD, PC, Time
wezterm.on('update-status', function(window, pane)
  local cells = {}

  print(window:active_key_table())

  local cwd_uri = pane:get_current_working_dir()

  local cwd = ""
  local hostname = ""
  if cwd_uri then
    if type(cwd_uri) == "userdata" then
      cwd = cwd_uri.file_path
      hostname = cwd_uri.host or wezterm.hostname()
    else
      cwd_uri = cwd_uri:sub(8)
      local slash = cwd_uri:find '/'
      if slash then
        hostname = cwd_uri:sub(1, slash - 1)
        -- and extract the cwd from the uri, decoding %-encoding
        cwd = cwd_uri:sub(slash):gsub('%%(%x%x)', function(hex)
          return string.char(tonumber(hex, 16))
        end)
      end
    end

    -- Remove the domain name portion of the hostname
    local dot = hostname:find '[.]'
    if dot then
      hostname = hostname:sub(1, dot - 1)
    end
    if hostname == '' then
      hostname = wezterm.hostname()
    end
  end

  local date = wezterm.strftime '%H:%M'
  table.insert(cells, date)

  for _, b in ipairs(wezterm.battery_info()) do
    table.insert(cells, string.format('%.0f%%', b.state_of_charge * 100))
  end

  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

    -- Color palette for the backgrounds of each cell
  local colors = {
    '#3c1361',
    '#52307c',
    '#663a82',
    '#7c5295',
    '#b491c8',
  }

  -- Foreground color for the text across the fade
  local text_fg = '#c0c0c0'

  -- The elements to be formatted
  local elements = {}
  -- How many cells have been formatted
  local num_cells = 0

  -- Translate a cell into elements
  function push(text, is_last)
    local cell_no = num_cells + 1
    table.insert(elements, { Foreground = { Color = text_fg } })
    table.insert(elements, { Background = { Color = colors[cell_no] } })
    table.insert(elements, { Text = ' ' .. text .. ' ' })
    if not is_last then
      table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
      table.insert(elements, { Text = SOLID_LEFT_ARROW })
    end
    num_cells = num_cells + 1
  end

  while #cells > 0 do
    local cell = table.remove(cells, 1)
    push(cell, #cells == 0)
  end

  local DESKTOP = wezterm.nerdfonts.md_desktop_mac
  local DIRECTORY = wezterm.nerdfonts.oct_file_directory
  local timer_icon = wezterm.nerdfonts.md_timer

  local form = {
    { Background = { Color = colors[3] } },
    { Foreground = { Color = "" } },
    { Text = " " .. DIRECTORY .. " " .. cwd .. " ", },
    { Background = { Color = colors[3] } },
    { Foreground = { Color = "" } },
    { Text = " " .. DESKTOP .. " " .. hostname .. " ", },
    { Background = { Color = colors[3] } },
    { Foreground = { Color = "" } },
    { Text = " " .. timer_icon .. " " .. date .. " "},
  }

  -- window:set_right_status(wezterm.format(elements))
  window:set_right_status(wezterm.format(form))

  local left_status = {
    { Text = " " .. "Hello" .. " "}
  }
  window:set_left_status(wezterm.format(left_status))
end)

-- Tab Name
wezterm.on(
  "format-tab-title",
  function(tab, tabs, pane, config, hover, maxWidth)
    local pane = tab.active_pane
    local title = helper.basename(pane.foreground_process_name)
    local icon = helper.get_prefer_icon(title)

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
      { Background = { Color = BLUE } },
      { Foreground = { Color = CRUST } },
      { Text = ' ' .. icon .. ' ' .. title .. ' ' },
      { Background = { Color = CRUST } },
      { Foreground = { Color = BLUE } },
    }
  end
)


return {}
