--[[
    Author: Alexander Thorwaldson 
    Email: alex@zoobz.io
    Github: https://github.com/zoobzio
--]]

-- install plugins
require("plugins").setup({
	"gruvbox-community/gruvbox",
	"kyazdani42/nvim-web-devicons",
	"nvim-treesitter/nvim-treesitter",
	"nvim-lualine/lualine.nvim",
	"tiagovla/scope.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"stevearc/aerial.nvim",
	"neovim/nvim-lspconfig",
	"nvimdev/lspsaga.nvim",
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	"ray-x/lsp_signature.nvim",
	"onsails/lspkind.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"windwp/nvim-ts-autotag",
	"windwp/nvim-autopairs",
	"sbdchd/neoformat",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"preservim/nerdcommenter",
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",
	"folke/noice.nvim",
	"jackMort/ChatGPT.nvim",
})

-- configure editor w/ shortcuts
require("editor").setup({
	-- buffers
	{ mode = "n", expr = "<Leader>1", cmd = ":LualineBuffersJump 1<CR>" },
	{ mode = "n", expr = "<Leader>2", cmd = ":LualineBuffersJump 2<CR>" },
	{ mode = "n", expr = "<Leader>3", cmd = ":LualineBuffersJump 3<CR>" },
	{ mode = "n", expr = "<Leader>4", cmd = ":LualineBuffersJump 4<CR>" },
	{ mode = "n", expr = "<Leader>5", cmd = ":LualineBuffersJump 5<CR>" },
	{ mode = "n", expr = "<Leader>6", cmd = ":LualineBuffersJump 6<CR>" },
	{ mode = "n", expr = "<Leader>7", cmd = ":LualineBuffersJump 7<CR>" },
	{ mode = "n", expr = "<Leader>8", cmd = ":LualineBuffersJump 8<CR>" },
	{ mode = "n", expr = "<Leader>9", cmd = ":LualineBuffersJump 9<CR>" },
	{ mode = "n", expr = "<Leader>q", cmd = ":bd<CR>" },
	-- tabs
	{ mode = "n", expr = "<Leader>=", cmd = ":tabnew<CR>" },
	{ mode = "n", expr = "<Leader>-", cmd = ":tabclose<CR>" },
	{ mode = "n", expr = "<Leader>[", cmd = ":tabprevious<CR>" },
	{ mode = "n", expr = "<Leader>]", cmd = ":tabnext<CR>" },
	-- telescope finders
	{ mode = "n", expr = "<Leader>ff", cmd = ":Telescope find_files<CR>" },
	{ mode = "n", expr = "<Leader>fb", cmd = ":Telescope scope buffers<CR>" },
	{ mode = "n", expr = "<Leader>ft", cmd = ":Telescope live_grep<CR>" },
	{ mode = "n", expr = "<Leader>fa", cmd = ":Telescope aerial<CR>" },
	{ mode = "n", expr = "<Leader>fd", cmd = ":Telescope file_browser<CR>" },
	-- lsp
	{ mode = "n", expr = "<Leader>hh", cmd = ":Lspsaga hover_doc<CR>" },
	{ mode = "n", expr = "<Leader>ha", cmd = ":Lspsaga code_action<CR>" },
	{ mode = "n", expr = "<Leader>hf", cmd = ":Lspsaga finder<CR>" },
	{ mode = "n", expr = "<Leader>hr", cmd = ":Lspsaga rename<CR>" },
	{ mode = "n", expr = "<Leader>hd", cmd = ":Lspsaga diagnostic_jump_next<CR>" },
	{ mode = "n", expr = "<Leader>hi", cmd = ":Lspsaga incoming_calls<CR>" },
	{ mode = "n", expr = "<Leader>ho", cmd = ":Lspsaga outgoing_calls<CR>" },
	-- ai
	{ mode = "n", expr = "<Leader>aa", cmd = ":ChatGPTEditWithInstructions<CR>" },
})
