local Telescope = {}

-- setup `telescope`
local function setup_telescope()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = "top",
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
			},
			repo = {
				list = {
					search_dirs = {
						"~/code",
					},
				},
			},
		},
	})

	-- load telescope extensions
	telescope.load_extension("aerial")
	telescope.load_extension("scope")
	telescope.load_extension("file_browser")
end

local function setup_aerial()
	require("aerial").setup()
end

function Telescope.setup()
	setup_aerial()
	setup_telescope()
end

return Telescope
