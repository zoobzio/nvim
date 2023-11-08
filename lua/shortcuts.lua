-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- buffers
map("n", "<Leader>1", ":LualineBuffersJump 1<CR>", { silent = true })
map("n", "<Leader>2", ":LualineBuffersJump 2<CR>", { silent = true })
map("n", "<Leader>3", ":LualineBuffersJump 3<CR>", { silent = true })
map("n", "<Leader>4", ":LualineBuffersJump 4<CR>", { silent = true })
map("n", "<Leader>5", ":LualineBuffersJump 5<CR>", { silent = true })
map("n", "<Leader>6", ":LualineBuffersJump 6<CR>", { silent = true })
map("n", "<Leader>7", ":LualineBuffersJump 7<CR>", { silent = true })
map("n", "<Leader>8", ":LualineBuffersJump 8<CR>", { silent = true })
map("n", "<Leader>9", ":LualineBuffersJump 9<CR>", { silent = true })
map("n", "<Leader>q", ":bd<CR>", { silent = true })

-- tabs
map("n", "<Leader>=", ":tabnew<CR>", { silent = true })
map("n", "<Leader>-", ":tabclose<CR>", { silent = true })
map("n", "<Leader>[", ":tabprevious<CR>", { silent = true })
map("n", "<Leader>]", ":tabnext<CR>", { silent = true })

-- telescope finders
map("n", "<Leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<Leader>fb", ":Telescope scope buffers<CR>", { silent = true })
map("n", "<Leader>ft", ":Telescope live_grep<CR>", { silent = true })
map("n", "<Leader>fa", ":Telescope aerial<CR>", { silent = true })
map("n", "<Leader>fd", ":Telescope file_browser<CR>", { silent = true })

-- lsp
map("n", "<Leader>hh", ":Lspsaga hover_doc<CR>", { silent = true })
map("n", "<Leader>ha", ":Lspsaga code_action<CR>", { silent = true })
map("n", "<Leader>hf", ":Lspsaga finder<CR>", { silent = true })
map("n", "<Leader>hr", ":Lspsaga rename<CR>", { silent = true })
map("n", "<Leader>hd", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
map("n", "<Leader>hi", ":Lspsaga incoming_calls<CR>", { silent = true })
map("n", "<Leader>ho", ":Lspsaga outgoing_calls<CR>", { silent = true })

-- autocommands
local api = vim.api

-- formatter
local formatGroup = api.nvim_create_augroup("FormatGroup", { clear = true })
api.nvim_create_autocmd(
	{ "BufWritePre" },
	{ pattern = "*.vue,*.ts,*.js,*.json,*.yaml,*.lua,*.go,*.py", command = "Neoformat", group = formatGroup }
)
