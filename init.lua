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

-- NeoVide Tweaks {{{
if vim.g.neovide then
  if vim.fn.has('macunix') then
    vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
  end

  vim.g.neovide_cursor_vfx_mode = "wireframe"
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_remember_window_size = true
end
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
  W = ':ToggleWrapMode<CR>',
  tf = ':Telescope find_files<CR>',
  tr = ':Telescope registers<CR>',
  tg = ':Telescope live_grep<CR>',
  tb = ':Telescope buffers<CR>',
  z = ':TZAtaraxis<CR>'
}

-- invert scroll for mac
vim.keymap.set('n', '<ScrollWheelDown>', '<ScrollWheelUp>', { silent = true })
vim.keymap.set('n', '<ScrollWheelUp>', '<ScrollWheelDown>', { silent = true })

if vim.fn.has('macunix') then
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-a>', 'ggVG') -- Select All normal mode
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('v', '<D-a>', 'ggVG') -- Select All visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
  vim.keymap.set('i', '<D-a>', '<ESC>ggVG') -- Select All insert mode
else
  vim.keymap.set('v', '<C-c>', '"+y') -- Copy
  vim.keymap.set('n', '<C-a>', 'ggVG') -- Select All normal mode
  vim.keymap.set('n', '<C-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<C-v>', '"+P') -- Paste visual mode
  vim.keymap.set('v', '<C-a>', 'ggVG') -- Select All visual mode
  vim.keymap.set('c', '<C-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli') -- Paste insert mode
  vim.keymap.set('i', '<C-a>', '<ESC>ggVG') -- Select All insert mode
end

-- }}}

-- Plugin Configuration {{{
require('neo-tree').setup {
  window = {
    position = 'right',
    width = 40
  }
}

require('feline').setup()

require('wrapping').setup()
-- }}}

-- vim:fdm=marker

