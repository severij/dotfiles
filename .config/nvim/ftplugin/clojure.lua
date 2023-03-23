vim.opt.shiftwidth = 2

vim.keymap.set({'n', 'v'}, '[[', function() vim.fn.search('^(', 'bW') end)
vim.keymap.set({'n', 'v'}, ']]', function() vim.fn.search('^(') end)
vim.keymap.set({'n', 'v'}, '[]', function() vim.fn.search(')\\n\\s*\\n', 'bW') end)
vim.keymap.set({'n', 'v'}, '][', function() vim.fn.search(')\\n\\s*\\n') end)
