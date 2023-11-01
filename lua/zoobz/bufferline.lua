local bg0 = '#282828'
local bg1 = '#3c3836'
local fg = '#ebdbb2'
local primary = '#b8bb26'

-- Color scheme
local colors = {
  bg       = '#282828',
  fg       = '#ebdbb2', 
  yellow   = '#fabd2f',
  cyan     = '#83a598',
  darkblue = '#076678',
  green    = '#b8bb26',
  orange   = '#fe8019',
  violet   = '#d3869b',
  magenta  = '#b16286',
  blue     = '#458588',
  red      = '#fb4934',
}

-- Color modes
local mode_color = {
  n = colors.green,
  i = colors.orange,
  v = colors.blue,
  [''] = colors.blue,
  V = colors.blue,
  c = colors.magenta,
  no = colors.red,
  s = colors.blue,
  S = colors.blue,
  [''] = colors.blue,
  ic = colors.yellow,
  R = colors.violet,
  Rv = colors.violet,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ['r?'] = colors.cyan,
  ['!'] = colors.red,
  t = colors.red,
}

require('bufferline').setup{
  highlights = {
    fill = {
      bg = 'None',
    },
    background = {
      bg = bg0
    }, 
    buffer_visible = {
      bg = bg0
    },
    buffer_selected = {
      fg = primary,
      bg = bg1,
      italic = false,
    },
    indicator_selected = {
      bg = bg1
    },
    indicator_visible = {
      bg = bg0
    },
    separator_selected = {
      bg = bg1,
    },
    separator = {
      fg = bg0,
      bg = bg0
    },
    modified_selected = {
      bg = bg1
    },
    modified = {
      bg = bg0
    }
  },
  options = {
    diagnostics = 'nvim_lsp',
    indicator = {
      style = "none"
    },
    show_close_icon = false,
    show_buffer_close_icons = false,
    custom_areas = {
      left = function()
        local result = {}
        table.insert(result, {text = "  ", bg = mode_color[vim.fn.mode()], fg = fg})
        return result
      end,
      right = function()
        local result = {}
        table.insert(result, {text = " buffers ", bg = mode_color[vim.fn.mode()], fg = fg})
        return result
      end,
    } 
  },
}
