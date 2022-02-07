local map = function (mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = ' '

map('n', '<Esc>', '<Cmd>nohl<CR><Esc>')
map('n', '<leader>bb', '<Cmd>Telescope buffers<CR>')
map('n', '<leader>bd', function () require'bufdelete'.bufdelete(0) end)
map('n', '<Leader>fc', '<Cmd>Telescope commands<CR>')
map('n', '<Leader>fr', '<Cmd>Telescope oldfiles<CR>')
map('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>')
map('n', '<Leader>fF', ':lua require"telescope.builtin".find_files{ cwd = "./" }<Left><Left><Left>')
map('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>')
map('n', '<Leader>fb', '<Cmd>Telescope file_browser<CR>')
map('n', '-', '<Cmd>Telescope file_browser cwd=%:p:h<CR>')
map('n', '<Leader>f.', function () require"config.telescope".find_dotfiles() end)
map('n', '<Leader>gg', '<Cmd>Git<CR>')
map('n', '<Leader>gb', '<Cmd>Git blame<CR>')
map('n', '<Leader>gl', '<Cmd>Git log<CR>')
map('n', '<Leader>gB', '<Cmd>Telescope git_branches<CR>')
map('n', '<Leader>gs', '<Cmd>Telescope git_status<CR>')
map('n', '[h', require'gitsigns.actions'.prev_hunk)
map('n', ']h', require'gitsigns.actions'.next_hunk)
map('n', '[d', vim.lsp.diagnostic.goto_prev)
map('n', ']d', vim.lsp.diagnostic.goto_next)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'gI', vim.lsp.buf.implementation)
map('n', 'gT', vim.lsp.buf.type_definition)
map('n', 'gr', vim.lsp.buf.references)
map('n', '<Leader>rr', vim.lsp.buf.rename)
map('n', '<Ctrl-h>', vim.lsp.buf.hover)
map('n', '<Leader>w', vim.lsp.buf.workspace_symbol)
map('n', '<Leader>hb', function () require'gitsigns'.blame_line { full = true } end)
map('n', '<Leader>hs', require'gitsigns'.stage_hunk)
map('n', '<Leader>hu', require'gitsigns'.undo_stage_hunk)
map('n', '<Leader>hp', require'gitsigns'.preview_hunk)
map('i', '<C-s>', '<C-o>:lua vim.lsp.buf.signature_help()<CR>')
map('i', '<C-j>', '<C-o>:lua require"luasnip".expand_or_jump()<CR>')
map('i', '<C-k>', 'luasnip#expand_or_jumpable() ? \'<Cmd>lua ' ..
                  'require"luasnip".jump(-1)<CR>\' : "<C-k>"', { expr = true })
