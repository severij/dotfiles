vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require'plugins'
require'config.quickfix'

local options = {
  termguicolors = true,
  laststatus = 3,
  number = true,
  wrap = false,
  wrapscan = false,
  expandtab = true,
  shiftwidth = 4,
  ignorecase = true,
  smartcase = true,
  cursorline = true,
  showmatch = true,
  splitright = true,
  splitbelow = true,
  mouse = 'a',
  undofile = true,
  confirm = true,
  background = 'dark',
  winbar = '%f',
  jumpoptions = 'stack'
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.keymap.set('n', '<Esc>', '<Cmd>nohl<CR><Esc>') -- Clear the search highlighting whenever <Esc> is pressed.                           
vim.keymap.set('n', '<C-c>', '<Cmd>Bwipeout<CR>')  -- Wipeout a buffer.

-- Do not pollute the jumplist
vim.keymap.set('n', 'n', "<cmd>keepj norm! n<CR>m'<C-o>``", { noremap = true})
vim.keymap.set('n', 'N', "<cmd>keepj norm! N<CR>m'<C-o>``", { noremap = true})
vim.keymap.set('n', '}', "<cmd>keepj norm! }<CR>m'<C-o>``", { noremap = true})
vim.keymap.set('n', '{', "<cmd>keepj norm! {<CR>m'<C-o>``", { noremap = true})

vim.cmd 'highlight WinSeparator guibg=None'
vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber | startinsert'
