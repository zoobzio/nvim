-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- lualine
map("n", "<Leader>1", ":BufferLineGoToBuffer 1<CR>", { silent = true })
map("n", "<Leader>2", ":BufferLineGoToBuffer 2<CR>", { silent = true })
map("n", "<Leader>3", ":BufferLineGoToBuffer 3<CR>", { silent = true })
map("n", "<Leader>4", ":BufferLineGoToBuffer 4<CR>", { silent = true })
map("n", "<Leader>5", ":BufferLineGoToBuffer 5<CR>", { silent = true })
map("n", "<Leader>6", ":BufferLineGoToBuffer 6<CR>", { silent = true })
map("n", "<Leader>7", ":BufferLineGoToBuffer 7<CR>", { silent = true })
map("n", "<Leader>8", ":BufferLineGoToBuffer 8<CR>", { silent = true })
map("n", "<Leader>9", ":BufferLineGoToBuffer 9<CR>", { silent = true })

-- buffers
map("n", "<Leader>s", ":w<CR>")
map("n", "<Leader>w", ":bd<CR>")

-- tabs
map("n", "<Leader>t", ":tabnew<CR>")
map("n", "<Leader>[", ":tabprevious<CR>")
map("n", "<Leader>]", ":tabnext<CR>")
map("n", "<Leader>q", ":tabclose<CR>")

-- telescope finders
map("n", "<Leader>ff", ":Telescope find_files prompt_prefix=🔍<CR>")
map("n", "<Leader>fb", ":Telescope scope buffers prompt_prefix=🔍<CR>")
map("n", "<Leader>ft", ":Telescope live_grep prompt_prefix=🔍<CR>")
map("n", "<Leader>fd", ":Telescope file_browser prompt_prefix=🔍<CR>")

-- telescope z
map("n", "<Leader>z", ":Telescope z<CR>")

-- telescope git
map("n", "<Leader>gc", ":Telescope git_commits prompt_prefix=🔍<CR>")
map("n", "<Leader>gs", ":Telescope git_status prompt_prefix=🔍<CR>")

-- autocommands
local api = vim.api

-- formatter
local formatGroup = api.nvim_create_augroup("FormatGroup", { clear = true })
api.nvim_create_autocmd(
	{ "BufWritePre" },
	{ pattern = "*.vue,*.ts,*.js,*.json,*.yaml,*.lua", command = "Neoformat", group = formatGroup }
)
