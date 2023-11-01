local set = vim.opt

-- configure nvim
set.textwidth = 0
set.title = true
set.hidden = true
set.nu = true
set.rnu = true
set.fillchars = {eob = " "}

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.cursorline = true
set.termguicolors = true
set.background = 'dark'

set.completeopt = menu, menuone, noselect

-- use plugins
require('zoobz.autopair')
require('zoobz.bufferline')
require('zoobz.cmp')
require('zoobz.gitsigns')
require('zoobz.lsp')
require('zoobz.lualine')
require('zoobz.telescope')
require('zoobz.treesitter')

-- configure color scheme
vim.cmd [[
  colorscheme gruvbox

  hi Normal guibg=NONE
  hi SignColumn guibg=NONE
  hi GitSignsAdd guibg=NONE guifg='#b8bb26'
  hi GitSignsChange guibg=NONE guifg='#fadb2f'
  hi GitSignsDelete guibg=NONE guifg='#fb4934'
]]
