local set = vim.opt

set.textwidth = 0
set.title = true
set.hidden = true
vim.cmd [[
  set number relativenumber
  set nu rnu
]]

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.cursorline = true
set.termguicolors = true
set.background = 'dark'

set.completeopt = menu, menuone, noselect

require('plugins')

require('zoobz.bufferline')
require('zoobz.lualine')
require('zoobz.nvim-tree')
require('zoobz.telescope')
require('zoobz.treesitter')
require('zoobz.lsp')
require('zoobz.autopair')

-- treesitter hotfix
require('hotfix.treesitter')
treesitter_migrate()

vim.cmd [[
  colorscheme gruvbox

  hi Normal guibg=NONE

  hi GitSignsAdd guibg='#282828' guifg='#b8bb26'
  hi GitSignsChange guibg='#282828' guifg='#fadb2f'
  hi GitSignsDelete guibg='#282828' guifg='#fb4934'
]]


