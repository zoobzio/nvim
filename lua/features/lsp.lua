local Lsp = {}

-- setup lspconfig
local function setup_lspconfig()
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	lspconfig.tsserver.setup({
		capabilities = capabilities,
	})
	lspconfig.pyright.setup({
		capabilities = capabilities,
	})
	lspconfig.gopls.setup({
		capabilities = capabilities,
	})
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
	})
	lspconfig.vuels.setup({
		capabilities = capabilities,
	})
end

-- setup lspsaga
local function setup_lspsaga()
	require("lspsaga").setup({
		ui = {
			code_action = "",
		},
	})
end

local function setup_lsplines()
	require("lsp_lines").setup()
end

local function setup_lspsignature()
	require("lsp_signature").setup({
		bind = true,
		handler_opts = {
			border = "rounded",
		},
	})
end

-- init lsp feature
function Lsp.setup()
	setup_lspconfig()
	setup_lspsaga()
	setup_lsplines()
	setup_lspsignature()
end

return Lsp
