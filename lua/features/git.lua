local Git = {}

local function setup_gitsigns()
	require("gitsigns").setup({
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "│" },
			topdelete = { text = "│" },
			changedelete = { text = "│" },
			untracked = { text = "│" },
		},
	})
end

function Git.setup() 
  setup_gitsigns()
end

return Git
