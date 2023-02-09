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

