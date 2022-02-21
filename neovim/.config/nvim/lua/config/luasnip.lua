local succesful, ls = pcall(require, 'luasnip')
if not succesful then return end

ls.config.set_config {
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true
}

vim.keymap.set({'i', 's'}, '<C-j>', function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({'i', 's'}, '<C-k>', function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
