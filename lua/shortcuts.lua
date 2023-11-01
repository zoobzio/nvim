-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- telescope
map("n", "<Leader>ff", ":Telescope find_files prompt_prefix=🔍<CR>")
map("n", "<Leader>fb", ":Telescope buffers prompt_prefix=🔍<CR>")
map("n", "<Leader>ft", ":Telescope live_grep prompt_prefix=🔍<CR>")
map("n", "<Leader>fd", ":Telescope file_browser prompt_prefix=🔍<CR>")

-- bufferline
map('n', '<Leader>=', '<Plug>(cokeline-focus-next)', { silent = true })
map('n', '<Leader>-', '<Plug>(cokeline-focus-prev)', { silent = true })
map('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>', { silent = true })
map('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>', { silent = true })
map('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>', { silent = true })
map('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>', { silent = true })
map('n', '<Leader>5', ':BufferLineGoToBuffer 5<CR>', { silent = true })
map('n', '<Leader>6', ':BufferLineGoToBuffer 6<CR>', { silent = true })
map('n', '<Leader>7', ':BufferLineGoToBuffer 7<CR>', { silent = true })
map('n', '<Leader>8', ':BufferLineGoToBuffer 8<CR>', { silent = true })
map('n', '<Leader>9', ':BufferLineGoToBuffer 9<CR>', { silent = true })
map('n', '<Leader>q', ':bd<CR>')

-- autocommands
local api = vim.api

-- formatter
local formatGroup = api.nvim_create_augroup("FormatGroup", { clear = true })
api.nvim_create_autocmd(
  { "BufWritePre" },
  { pattern = "*.vue,*.ts,*.js,*.json,*.yaml", command = "Neoformat", group = formatGroup }
)
