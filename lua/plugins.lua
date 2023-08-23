local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'
  
  -- theme
  use 'gruvbox-community/gruvbox'
  use 'kyazdani42/nvim-web-devicons'

  -- status bars
  use 'akinsho/bufferline.nvim'
  use 'nvim-lualine/lualine.nvim'
  
  -- file tree
  use {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  
  -- telescope
  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }

  -- lsp
  use 'neovim/nvim-lspconfig'

  -- code formatting
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use 'sbdchd/neoformat'

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }  
end)

