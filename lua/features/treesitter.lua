local Treesitter = {}

local function setup_treesitter()
  require("nvim-treesitter.configs").setup({
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
			"markdown",
			"markdown_inline",
			"bash",
			"vim",
			"regex",
		},
		autotag = {
			enable = true,
		},
	})
end

function Treesitter.setup()
  setup_treesitter()
end

return Treesitter
