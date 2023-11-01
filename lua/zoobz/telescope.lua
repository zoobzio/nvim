local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    }
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
  },
}

telescope.load_extension("file_browser")
