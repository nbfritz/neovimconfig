-- NeoVim Configuration

-- Initial Lua Setup {{{
local config_root = vim.fn.stdpath('config')
local set = vim.opt
-- }}}

-- Source Other Files {{{
vim.cmd('source '..config_root..'/lua/util.lua')
vim.cmd('source '..config_root..'/lua/plugins.lua')
-- }}}

-- Configuration {{{
vim.cmd.colorscheme('lucius')

vim.opt.termguicolors = true
vim.opt.number        = false

vim.opt.tabstop       = 2
vim.opt.shiftwidth    = 2
vim.opt.smarttab      = true
vim.opt.expandtab     = true
vim.opt.smartindent   = true

vim.opt.ruler         = true
vim.opt.visualbell    = true
vim.opt.showcmd       = true
vim.opt.list          = true

vim.opt.swapfile      = false
vim.opt.backup        = false
vim.opt.splitbelow    = true
vim.opt.splitright    = true
vim.opt.hlsearch      = false
vim.opt.ignorecase    = true
vim.opt.smartcase     = true


custom_commands {
  Settings = 'e '..config_root..'/init.lua',
  SettingsPlugins = 'e '..config_root..'/lua/plugins.lua',
  SettingsReload = 'source '..config_root..'/init.lua'
}
-- }}}

-- Keymaps {{{
leader_keymaps {
  f = ':NeoTreeFocusToggle<CR>',
  F = ':NeoTreeReveal<CR>',
  r = ':Mru<CR>',
  n = toggle('number'),
  h = toggle('hlsearch'),
  w = toggle('wrap'),
  tt = ':Telescope<CR>',
  tf = ':Telescope find_files<CR>',
  tr = ':Telescope registers<CR>',
  tg = ':Telescope live_grep<CR>',
  tb = ':Telescope buffers<CR>'
}
-- }}}

-- Plugin Configuration {{{
require('neo-tree').setup {
  window = {
    position = 'right',
    width = 40
  }
}

require('feline').setup()
-- }}}

-- vim:fdm=marker

