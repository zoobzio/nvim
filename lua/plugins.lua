--[[
    A plugin manager to handle dependency installation
    using `lazy.nvim`
--]]

local Plugins = {}

-- Setup dependencies using lazy.nvim as a package manager
local function setup_dependencies(plugins)
	-- install plugin manager
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)

	-- install plugins
	require("lazy").setup(plugins)
end

-- Setup features from features directory
local function setup_features()
	for feature in io.popen('ls -pUqAL "lua/features"'):lines() do
		feature = feature:match("^(.*)%.lua$")
		if feature then
			require("features." .. feature).setup()
		end
	end
end

-- Setup plugins
function Plugins.setup(plugins)
	setup_dependencies(plugins)
	setup_features()
end

return Plugins
