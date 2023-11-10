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
local function mode_color()
	local modes = {
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
	return modes[vim.fn.mode()]
end

local Workspace = {}

local function setup_lualine()
	require("lualine").setup({
		options = {
			-- Disable sections and component separators
			component_separators = "",
			section_separators = "",
			theme = {
				normal = { c = { fg = colors.fg, bg = colors.bg } },
				inactive = { c = { fg = colors.fg, bg = colors.bg } },
			},
		},
		sections = {
			-- inactive sections
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			-- active sections
			lualine_c = {
				{
					function()
						return "▊"
					end,
					color = function()
						return { fg = mode_color(), gui = "bold" }
					end,
					padding = { left = 0, right = 1 },
				},
				{
					"mode",
					color = function()
						return { fg = mode_color(), gui = "bold" }
					end,
				},
				{
					"filename",
					color = { fg = colors.magenta, gui = "bold" },
				},
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " " },
					diagnostics_color = {
						color_error = { fg = colors.red },
						color_warn = { fg = colors.yellow },
						color_info = { fg = colors.cyan },
					},
				},
				{ "progress" },
				{ "location" },
				{ "filesize" },
				{
					function()
						return "%="
					end,
				},
				{
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
				},
			},
			lualine_x = {
				{
					"o:encoding",
					fmt = string.upper,
					color = { fg = colors.fg },
				},
				{
					"fileformat",
					fmt = string.upper,
					icons_enabled = false,
					color = { fg = colors.fg },
				},
				{ "filetype" },
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
					diff_color = {
						added = { fg = colors.green },
						modified = { fg = colors.orange },
						removed = { fg = colors.red },
					},
				},
				{ "branch", icon = "", color = { fg = colors.magenta, gui = "bold" } },
				{
					function()
						return "▊"
					end,
					color = function()
						return { fg = mode_color(), gui = "bold" }
					end,
					padding = { left = 1, right = 0 },
				},
			},
		},
		tabline = {
			lualine_c = {
				{
					function()
						return "▊  "
					end,
					color = function()
						return { fg = mode_color(), gui = "bold" }
					end,
					padding = { left = 0, right = 1 },
				},
				{
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
				},
			},
			lualine_x = {
				{
					"tabs",
					show_modified_status = false,
					tabs_color = {
						active = { fg = colors.magenta, gui = "bold" },
						inactive = { fg = colors.bg2 },
					},
				},
				{
					function()
						return "▊"
					end,
					color = function()
						return { fg = mode_color(), gui = "bold" }
					end,
					padding = { left = 1, right = 0 },
				},
			},
		},
		inactive_sections = {
			-- remove defaults
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	})
end

-- setup scope
local function setup_scope()
	require("scope").setup()
end

-- setup lualine
function Workspace.setup()
	setup_lualine()
	setup_scope()
end

return Workspace
