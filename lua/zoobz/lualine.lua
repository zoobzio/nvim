local lualine = require("lualine")

-- Color scheme
local colors = {
	bg = "None",
	bg1 = "#3c3836",
	bg2 = "#928374",
	fg = "#ebdbb2",
	yellow = "#fabd2f",
	cyan = "#83a598",
	darkblue = "#076678",
	green = "#b8bb26",
	orange = "#fe8019",
	violet = "#d3869b",
	magenta = "#b16286",
	blue = "#458588",
	red = "#fb4934",
}

-- Selects a color based on neovims mode
local function color()
	local mode_color = {
		n = colors.violet,
		i = colors.orange,
		v = colors.blue,
		[""] = colors.blue,
		V = colors.blue,
		c = colors.cyan,
		no = colors.magenta,
		s = colors.blue,
		S = colors.blue,
		[""] = colors.blue,
		ic = colors.yellow,
		R = colors.violet,
		Rv = colors.violet,
		cv = colors.red,
		ce = colors.red,
		r = colors.cyan,
		rm = colors.cyan,
		["r?"] = colors.cyan,
		["!"] = colors.red,
		t = colors.red,
	}
	return { fg = mode_color[vim.fn.mode()], gui = "bold" }
end

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	tabline = {
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

-- Inserts a component in lualine_c at left tab section
local function ins_tab_left(component)
	table.insert(config.tabline.lualine_c, component)
end

-- Inserts a component in lualine_x ot right tab section
local function ins_tab_right(component)
	table.insert(config.tabline.lualine_x, component)
end

ins_tab_left({
	function()
		return "▊ "
	end,
	color = color,
	padding = { left = 0, right = 1 },
})

ins_tab_left({
	"buffers",
	icons_enabled = false,
	mode = 2,
	buffers_color = {
		active = { fg = colors.magenta, gui = "bold" },
		inactive = { fg = colors.bg2 },
	},
	symbols = {
		modified = " +",
		alternate_file = "",
	},
})

ins_tab_right({
	"tabs",
	show_modified_status = false,
	tabs_color = {
		active = { fg = colors.magenta, gui = "bold" },
		inactive = { fg = colors.bg2 },
	},
})

ins_tab_right({
	function()
		return "▊"
	end,
	color = color,
	padding = { left = 1, right = 0 },
})

ins_left({
	function()
		return "▊"
	end,
	color = color,
	padding = { left = 0, right = 1 },
})

ins_left({
	"mode",
	color = color,
})

ins_left({ "filename", color = { fg = colors.magenta, gui = "bold" } })

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	--symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
})

ins_left({ "progress" })

ins_left({ "location" })

ins_left({ "filesize" })

ins_left({
	function()
		return "%="
	end,
})

ins_left({
	-- Lsp server name
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " ",
	color = { fg = colors.blue },
})

-- Add components to right sections
ins_right({
	"o:encoding",
	fmt = string.upper,
	cond = conditions.hide_in_width,
	color = { fg = colors.fg },
})

ins_right({
	"fileformat",
	fmt = string.upper,
	icons_enabled = false,
	color = { fg = colors.fg },
})

ins_right({ "filetype" })

ins_right({
	"diff",
	--symbols = { added = " ", modified = "󰝤", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
})

ins_right({ "branch", icon = "", color = { fg = colors.magenta, gui = "bold" } })

ins_right({
	function()
		return "▊"
	end,
	color = color,
	padding = { left = 1, right = 0 },
})

lualine.setup(config)
