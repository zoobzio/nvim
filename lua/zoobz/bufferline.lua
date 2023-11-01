-- Color scheme
local colors = {
  bg       = '#3c3836',
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

require('bufferline').setup{
  highlights = {
    fill = {
      bg = 'None',
    },
    background = {
      bg = 'None'
    }, 
    buffer_visible = {
      bg = 'None'
    },
    buffer_selected = {
      fg = colors.violet,
      bg = 'None',
      italic = false,
    },
    indicator_selected = {
      bg = 'None',
      fg = colors.violet
    },
    indicator_visible = {
      bg = 'None',
    },
    separator_selected = {
      bg = 'None',
    },
    separator = {
      bg = 'None'
    },
    modified_selected = {
      bg = 'None'
    },
    modified = {
      bg = 'None'
    },
    error = {
      bg = 'None',
      italic = true
    },
    error_selected = {
      fg = colors.red,
      italic = true
    },
    error_visible = {
      bg = 'None',
      italic = true
    },
    error_diagnostic = {
      bg = 'None',
      italic = true
    },
    error_diagnostic_selected = {
      fg = colors.red,
      italic = true
    },
    error_diagnostic_visible = {
      bg = 'None',
      italic = true
    }
  },
  options = {
    diagnostics = 'nvim_lsp',
    show_close_icon = false,
    show_buffer_close_icons = false,
    separator_style = {'', ''},
    indicator = {
      style = 'none'
    },
    custom_areas = {
      left = function()
        local result = {}
        table.insert(result, {text = '  ', fg = colors.violet})
        return result
      end,
    }
  },
}
