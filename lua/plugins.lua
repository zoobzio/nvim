local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	-- packer
	use("wbthomason/packer.nvim")

	-- theme
	use("gruvbox-community/gruvbox")
	use("kyazdani42/nvim-web-devicons")

	-- buffers & tabs
	use("nvim-lualine/lualine.nvim")
	use("tiagovla/scope.nvim")

	-- file tree
	use({
		"kyazdani42/nvim-tree.lua",
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-packer.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "cljoly/telescope-repo.nvim" })

	-- aerial
	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- lsp
	use("neovim/nvim-lspconfig")
	use("nvimdev/lspsaga.nvim")
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	})

	-- code completion
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	use({ "hrsh7th/nvim-cmp" })

	-- code snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- code formatting
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")
	use("sbdchd/neoformat")

	-- git
	use({ "lewis6991/gitsigns.nvim" })
	use({ "tpope/vim-fugitive" })
	use({ "kdheepak/lazygit.nvim" })

	-- comments
	use({ "preservim/nerdcommenter" })

	-- golang
	use({ "fatih/vim-go" })

	-- diagnostics
	use({ "folke/trouble.nvim" })

	-- ai
	--[[use({
		"jackMort/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})]]
end)
