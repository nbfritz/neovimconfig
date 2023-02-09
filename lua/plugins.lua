-- NeoVim plugin configuration

-- Utilities to support Packer {{{
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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
--- }}}

-- Packer Plugin Registry {{{
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lvht/mru'

  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' }
  }

  use {
    'jonathanfilip/vim-lucius', 
    as = "lucius"
  }

  use {
    'weirongxu/plantuml-previewer.vim',
    requires = { 'tyru/open-browser.vim', 'aklt/plantuml-syntax' }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'feline-nvim/feline.nvim',
    requires = { 'lewis6991/gitsigns.nvim' }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
-- }}}

-- vim:fdm=marker
