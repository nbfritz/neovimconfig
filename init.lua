-- NeoVim Configuration

-- Helper Functions {{{

function vim_commands(options)
  for k,v in pairs(options) do
    vim.cmd[k](v)
  end
end


function set_options(options)
  for k,v in pairs(options) do
    vim.o[k] = v
  end
end

function custom_commands(options)
  for k,v in pairs(options) do
    vim.api.nvim_create_user_command(k, v, { nargs = 0 })
  end
end

function leader_keymaps(options)
  for k,v in pairs(options) do
    vim.keymap.set('n', '<Leader>' .. k, v, { silent = true })
  end
end

function toggle(option)
  vim.o[option] = not vim.o[option]
end
-- }}}

-- Source Other Files {{{
vim.cmd("source ~/.config/nvim/lua/plugins.lua")
-- }}}

-- Configuration {{{
vim_commands {
  colorscheme = "lucius"
}

set_options {
  guifont = "Hack Nerd Font:h15",
  number = false,

  tabstop     = 2,
  shiftwidth  = 2,
  smarttab    = true,
  expandtab   = true,
  smartindent = true,

  ruler       = true,
  visualbell  = true,
  showcmd     = true,
  list        = true,

  swapfile    = false,
  backup      = false,
  splitbelow  = true,
  splitright  = true,
  hlsearch    = false,
  ignorecase  = true,
  smartcase   = true
}

custom_commands {
  Settings = 'e ~/.config/nvim/init.lua',
  SettingsPlugins = 'e ~/.config/nvim/lua/plugins.lua',
  SettingsReload = 'source ~/.config/nvim/init.lua'
}
-- }}}

-- Keymaps {{{
leader_keymaps {
  f = ":NeoTreeFocusToggle<CR>",
  F = ":NeoTreeReveal<CR>",
  r = ":Mru<CR>",
  n = toggle('number'),
  h = toggle('hlsearch'),
  w = toggle('wrap')
}
-- }}}

-- Plugin Configuration {{{
require('neo-tree').setup {
  window = {
    position = 'right',
    width = 40
  }
}

require('gitsigns').setup {
  signcolumn = true
}

require('feline').setup()
-- }}}

-- vim:fdm=marker

