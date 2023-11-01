local bg0 = '#282828'
local bg1 = '#3c3836'
local primary = '#b8bb26'

require('bufferline').setup{
  highlights = {
    fill = {
      bg = 'None',
    },
    background = {
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
        table.insert(result, {text = "  ", bg = primary, fg = 'None'})
        return result
      end,
    } 
  },
}
