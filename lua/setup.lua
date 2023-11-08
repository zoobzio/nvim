local set = vim.opt

-- configure nvim
set.textwidth = 0
set.title = true
--set.hidden = true
set.nu = true
set.rnu = true
set.fillchars = { eob = " " }

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.cursorline = true
set.termguicolors = true
set.background = "dark"

set.completeopt = "menu,menuone,noselect"

-- use plugins
require("zoobz.autopair")
--require("zoobz.chatgpt")
require("zoobz.cmp")
require("zoobz.gitsigns")
require("zoobz.lsp")
require("zoobz.lualine")
require("zoobz.scope")
require("zoobz.telescope")
require("zoobz.treesitter")
require("zoobz.ui")

-- configure color scheme
vim.cmd([[
  colorscheme gruvbox

  filetype plugin on

  hi Normal guibg=NONE
  hi SignColumn guibg=NONE
  
  hi SagaNormal guibg=NONE
  
  hi GitSignsAdd guibg=NONE guifg='#b8bb26'
  hi GitSignsChange guibg=NONE guifg='#fadb2f'
  hi GitSignsDelete guibg=NONE guifg='#fb4934'

  hi DiagnosticSignError guibg=NONE guifg='#fb4934'
  hi DiagnosticSignWarn guibg=NONE guifg='#fabd2f'
  hi DiagnosticSignHint guibg=NONE guifg='#458588'
  hi DiagnosticSignInfo guibg=NONE guifg='#83a598'

  hi NotifyBackground guibg='#000000'
]])

-- diagnostics
vim.diagnostic.config({
	virtual_text = false,
})
