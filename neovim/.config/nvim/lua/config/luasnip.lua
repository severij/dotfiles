local load_succesful, luasnip = pcall(require, 'luasnip')

-- In case LuaSnip isn't installed yet:
if not load_succesful then return end

-- Keymaps

vim.keymap.set('i', '<Tab>', function()
  return luasnip.expand_or_jumpable() and '<Plug>luasnip-expand-or-jump' or '<Tab>'
end, { silent = true, expr = true })

vim.keymap.set('i', '<C-j>', function()
  return luasnip.choice_active() and '<Plug>luasnip-next-choice' or '<C-j>'
end, { silent = true, expr = true })

vim.keymap.set('i', '<C-k>', function()
  return luasnip.choice_active() and '<Plug>luasnip-prev-choice' or '<C-k>'
end, { silent = true, expr = true })

-- Load the snippets
require'luasnip.loaders.from_lua'.load { paths = { '~/.config/nvim/lua/snippets' }}

