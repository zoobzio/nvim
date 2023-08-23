local dark = '#282828'
local high = '#d3869b'

require("bufferline").setup{
  highlights = {
    fill = {
      bg = dark,
    },
    background = {
      bg = dark,
    },
    buffer_selected = {
      fg = high,
      italic = false,
    },
    indicator_selected = {
      fg = high,
    },
    separator = {
      bg = dark,
    },
  },
  options = {
    show_close_icon = false,
    show_buffer_close_icons = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = " Directory",
        text_align = "left",
        separator = true
      }
    },
  }
}
