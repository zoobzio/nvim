-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- lualine
map("n", "<Leader>1", ":LualineBuffersJump 1<CR>", { silent = true })
map("n", "<Leader>2", ":LualineBuffersJump 2<CR>", { silent = true })
map("n", "<Leader>3", ":LualineBuffersJump 3<CR>", { silent = true })
map("n", "<Leader>4", ":LualineBuffersJump 4<CR>", { silent = true })
map("n", "<Leader>5", ":LualineBuffersJump 5<CR>", { silent = true })
map("n", "<Leader>6", ":LualineBuffersJump 6<CR>", { silent = true })
map("n", "<Leader>7", ":LualineBuffersJump 7<CR>", { silent = true })
map("n", "<Leader>8", ":LualineBuffersJump 8<CR>", { silent = true })
map("n", "<Leader>9", ":LualineBuffersJump 9<CR>", { silent = true })

-- buffers
map("n", "<Leader>w", ":w<CR>")
map("n", "<Leader>q", ":bd<CR>")

-- tabs
map("n", "<Leader>=", ":tabnew<CR>")
map("n", "<Leader>-", ":tabclose<CR>")
map("n", "<Leader>[", ":tabprevious<CR>")
map("n", "<Leader>]", ":tabnext<CR>")

-- telescope finders
map("n", "<Leader>ff", ":Telescope find_files prompt_prefix=🔍<CR>")
map("n", "<Leader>fb", ":Telescope scope buffers prompt_prefix=🔍<CR>")
map("n", "<Leader>ft", ":Telescope live_grep prompt_prefix=🔍<CR>")
map("n", "<Leader>fd", ":Telescope file_browser prompt_prefix=🔍<CR>")
map("n", "<Leader>fz", ":Telescope z prompt_prefix=🔍<CR>")
map("n", "<Leader>fr", ":Telescope repo list prompt_prefix=🔍<CR>")
map("n", "<Leader>fa", ":Telescope aerial prompt_prefix=🔍<CR>")

-- git
map("n", "<Leader>gg", ":LazyGit<CR>")

-- diagnostics
map("n", "<Leader>t", ":TroubleToggle document_diagnostics<CR>")

-- autocommands
local api = vim.api

-- formatter
local formatGroup = api.nvim_create_augroup("FormatGroup", { clear = true })
api.nvim_create_autocmd(
	{ "BufWritePre" },
	{ pattern = "*.vue,*.ts,*.js,*.json,*.yaml,*.lua,*.go,*.py", command = "Neoformat", group = formatGroup }
)
