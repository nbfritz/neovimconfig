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
  return function() vim.o[option] = not vim.o[option] end
end

