local status, telescope = pcall(require, "telescope")
if not status then
	return
end

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

telescope.load_extension("aerial")
telescope.load_extension("scope")
telescope.load_extension("z")
telescope.load_extension("repo")
telescope.load_extension("packer")
telescope.load_extension("file_browser")
