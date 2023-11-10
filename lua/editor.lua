local Editor = {}

local function setup_vim()
	vim.opt.textwidth = 0
	vim.opt.title = true
	vim.opt.hidden = true
	vim.opt.nu = true
	vim.opt.rnu = true
	vim.opt.fillchars = { eob = " " }

	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true
	vim.opt.cursorline = true
	vim.opt.termguicolors = true
	vim.opt.background = "dark"

	vim.opt.completeopt = "menu,menuone,noselect"
end

local function setup_theme()
	vim.cmd([[
    colorscheme gruvbox

    filetype plugin on

    hi Normal guibg=NONE
    hi SignColumn guibg=NONE
    
    hi SagaNormal guibg=NONE

    hi NormalFloat guibg=NONE
    hi FloatBorder guibg=NONE
    
    hi GitSignsAdd guibg=NONE guifg='#b8bb26'
    hi GitSignsChange guibg=NONE guifg='#fadb2f'
    hi GitSignsDelete guibg=NONE guifg='#fb4934'

    hi DiagnosticSignError guibg=NONE guifg='#fb4934'
    hi DiagnosticSignWarn guibg=NONE guifg='#fabd2f'
    hi DiagnosticSignHint guibg=NONE guifg='#458588'
    hi DiagnosticSignInfo guibg=NONE guifg='#83a598'

    hi NotifyBackground guibg='#000000'
  ]])
end

local function setup_diagnostics()
	vim.diagnostic.config({
		virtual_text = false,
	})
	local signs = { Error = "", Warning = "", Hint = "", Information = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

local function setup_formatter()
	local formatGroup = vim.api.nvim_create_augroup("FormatGroup", { clear = true })
	vim.api.nvim_create_autocmd(
		{ "BufWritePre" },
		{ pattern = "*.vue,*.ts,*.js,*.json,*.yaml,*.lua,*.go,*.py", command = "Neoformat", group = formatGroup }
	)
end

local function setup_shortcuts(shortcuts)
	for _, shortcut in pairs(shortcuts) do
		local options = { noremap = true, silent = true }
		if shortcut.opts then
			options = vim.tbl_extend("force", options, shortcut.opts)
		end
		vim.api.nvim_set_keymap(shortcut.mode, shortcut.expr, shortcut.cmd, options)
	end
end

function Editor.setup(shortcuts)
	setup_vim()
	setup_theme()
	setup_diagnostics()
	setup_formatter()
	setup_shortcuts(shortcuts)
end

return Editor
