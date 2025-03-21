local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'ellisonleao/gruvbox.nvim'
  ---use 'nvim-treesitter/nvim-treesitter'
  use {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  --- LSP
  use { "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig" }

  --- AutoComplete
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
---  use "github/copilot.vim"
  --
  use {
  'vyfor/cord.nvim',
  run = ':Cord update',
  -- config = function()
  --   require('cord').setup {}
  -- end
}
use 'lewis6991/gitsigns.nvim'
use 'tpope/vim-fugitive'
-- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
