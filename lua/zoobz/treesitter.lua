local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = {
		"vue",
		"typescript",
		"javascript",
		"tsx",
		"toml",
		"fish",
		"php",
		"json",
		"yaml",
		"swift",
		"css",
		"scss",
		"html",
		"lua",
		"python",
		"go",
	},
	autotag = {
		enable = true,
	},
})
