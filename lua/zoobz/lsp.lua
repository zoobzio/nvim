local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

-- TypeScript
nvim_lsp.tsserver.setup({})

-- Python
nvim_lsp.pyright.setup({})

-- Golang
nvim_lsp.gopls.setup({})

-- Lua
nvim_lsp.lua_ls.setup({})
