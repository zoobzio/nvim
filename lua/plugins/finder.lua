return {
	-- Aerial
	{
		"stevearc/aerial.nvim",
		opts = {},
	},

	-- Scope
	{
		"tiagovla/scope.nvim",
		opts = {},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		cmd = "Telescope",
		opts = {
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
					height = 0.5,
					width = 0.6,
				},
			},
			extensions = {
				file_browser = {
					hijack_netrw = true,
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					dir_icon = "🖿",
					git_status = false,
					initial_mode = "normal",
				},
				repo = {
					list = {
						search_dirs = {
							"~/code",
						},
					},
				},
			},
		},
		config = function(_, opts)
			-- setup telescope
			local telescope = require("telescope")
			telescope.setup(opts)

			-- load extensions
			telescope.load_extension("aerial")
			telescope.load_extension("scope")
			telescope.load_extension("file_browser")
		end,
		keys = {
			{ "ff", ":Telescope find_files<cr>" },
			{ "fb", ":Telescope scope buffers<cr>" },
			{ "ft", ":Telescope live_grep<cr>" },
			{ "fa", ":Telescope aerial<cr>" },
			{ "fd", ":Telescope file_browser<cr>" },
		},
	},
}
