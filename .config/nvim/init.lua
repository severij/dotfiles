require('helpers')
require('plugins')

cmd('filetype plugin indent on')
cmd('syntax enable')

opt('o', 'backspace', 'indent,eol,start')
opt('o', 'scrolloff', 5)
opt('o', 'sidescrolloff', 10)
opt('o', 'hidden', true)
opt('o', 'lazyredraw', true)
opt('o', 'history', 1000)
-- opt('o', 'termguicolors', true)
-- opt('o', 'pumblend', 15)
-- opt('o', 'winblend', 15)
opt('o', 'cursorline', true)
opt('o', 'inccommand', 'split')
opt('o', 'wrapscan', false)
opt('o', 'showmatch', true)
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('o', 'incsearch', true)
opt('o', 'hlsearch', true)
opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)
opt('b', 'textwidth', 80)
opt('w', 'colorcolumn', '+1')
opt('o', 'smarttab', true)
opt('b', 'expandtab', true)
opt('b', 'tabstop', 4)
opt('b', 'shiftwidth', 4)
opt('o', 'mouse', 'a')
opt('o', 'splitright', true)
opt('o', 'splitbelow', true)
opt('o', 'undofile', true)
opt('b', 'autoindent', true)
opt('o', 'directory', '.')
opt('o', 'equalalways', true)
opt('o', 'listchars', 'tab:-->,trail:.,eol:$,extends:>,precedes:<,nbsp:~')
opt('o', 'switchbuf', 'useopen,usetab')
opt('o', 'completeopt', 'menuone,noinsert,noselect')

vim.cmd('colorscheme xenon')
opt('o', 'background', 'dark')

vim.g.mapleader = ' '

vim.g['sneak#label'] = 1
vim.g['sneak#use_ic_scs'] = 1
vim.g['sneak#target_labels'] = 'ghfjdkslGHFJDKSLbntyBNTYqpa;QPA:'

if fn.executable('rg') then
   opt('o', 'grepprg', 'rg --vimgrep')
   opt('o', 'grepformat', '%f:%l:%c:%m')
end

map('', '<leader>ff', ':Telescope find_files<cr>')
map('', '<leader>fg', ':Telescope live_grep<cr>')
map('', '<leader>fb', ':Telescope buffers<cr>')
map('', '<leader>f.', ':lua require("severij.telescope").dotfiles()<cr>')
map('', '<leader><leader>', ':Telescope file_browser<cr>')
map('', '<leader>gg', ':Git<cr>')
map('', '<leader>gb', ':Git blame<cr>')
map('', '<leader>gl', ':Git log<cr>')

cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
