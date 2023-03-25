local has_luasnip, luasnip = pcall(require, 'luasnip')
if not has_luasnip then return end

luasnip.setup({
  region_check_events = "CursorHold,InsertLeave,InsertEnter",
  -- those are for removing deleted snippets, also a common problem
  delete_check_events = "TextChanged,InsertEnter",
})

-- Keymaps

vim.keymap.set('i', '<Tab>', function()
  return luasnip.expand_or_jumpable() and '<Plug>luasnip-expand-or-jump' or '<Tab>'
end, { silent = true, expr = true })

vim.keymap.set('i', '<S-Tab>', function()
  return luasnip.jumpable(-1) and '<Plug>luasnip-jump-prev' or '<S-Tab>'
end, { silent = true, expr = true })

vim.keymap.set('i', '<C-j>', function()
  return luasnip.choice_active() and '<Plug>luasnip-next-choice' or '<C-j>'
end, { silent = true, expr = true })

vim.keymap.set('i', '<C-k>', function()
  return luasnip.choice_active() and '<Plug>luasnip-prev-choice' or '<C-k>'
end, { silent = true, expr = true })

-- Load the snippets
require'luasnip.loaders.from_lua'.load { paths = { '~/.config/nvim/lua/snippets' }}
