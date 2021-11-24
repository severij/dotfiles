require('globals')
require('plugins')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

set_options {
  number = true,
  relativenumber = true,
  pumheight = 10,
  hidden = true,
  incsearch = true,
  hlsearch = true,
  ignorecase = true,
  smartcase = true,
  wrap = false,
  wrapscan = false,
  cursorline = true,
  backspace = 'indent,eol,start',
  sidescrolloff = 10,
  lazyredraw = true,
  history = 1000,
  termguicolors = true,
  pumblend = 15,
  winblend = 15,
  inccommand = 'split',
  showmatch = true,
  textwidth = 100,
  colorcolumn = '+1',
  smarttab = true,
  tabstop = 8,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  splitright = true,
  splitbelow = true,
  undofile = true,
  autoindent = true,
  swapfile = false,
  directory = '.',
  equalalways = true,
  switchbuf = 'useopen,usetab',
  completeopt = 'menuone,noinsert,noselect',
  background = 'dark'
}

pcall(vim.cmd, 'colorscheme gruvbox')

set_global_vars {
  mapleader = ' '
}

if vim.fn.executable('rg') then
  local rg_cmd = 'rg --vimgrep'
  set_options {
    grepprg = rg_cmd,
    grepformat = '%f:%l:%c:%m'
  }
end

map {
  n = {
    ['<Esc>']      = ':nohl<cr><Esc>',
    ['<leader>bb'] = ':lua require"config.telescope".buffers()<cr>',
    ['<leader>bd'] = ':confirm bd<cr>',
    ['<leader>fb'] = ':lua require"telescope".extensions.file_browser.file_browser()<cr>',
    ['<leader>ff'] = ':lua require"config.telescope".find_files()<cr>',
    ['<leader>fF'] = ':lua require"config.telescope".find_files{ cwd = ask_directory() }<cr>',
    ['<leader>fg'] = ':lua require"config.telescope".live_grep()<cr>',
    ['<leader>fG'] = ':lua require"config.telescope".live_grep{ cwd = ask_directory() }<cr>',
    ['<leader>f.'] = ':lua require"config.telescope".find_dotfiles()<cr>',
    ['<leader>gg'] = ':Git<cr>',
    ['<leader>gb'] = ':Git blame<cr>',
    ['<leader>gl'] = ':Git log<cr>',
    ['<leader>gB'] = ':lua require"telescope.builtin".git_branches()<cr>',
    ['<leader>gs'] = ':lua require"telescope.builtin".git_status()<cr>',
    ['[h']         = ':lua require"gitsigns.actions".prev_hunk()<cr>',
    [']h']         = ':lua require"gitsigns.actions".next_hunk()<cr>',
    ['<leader>hb'] = ':lua require"gitsigns".blame_line { full = true }<cr>',
    ['<leader>hs'] = ':lua require"gitsigns".stage_hunk()<cr>',
    ['<leader>hu'] = ':lua require"gitsigns".undo_stage_hunk()<cr>',
    ['<leader>hp'] = ':lua require"gitsigns".preview_hunk()<cr>',
    ['[d']         = ':lua vim.lsp.diagnostic.goto_prev()<cr>',
    [']d']         = ':lua vim.lsp.diagnostic.goto_next()<cr>',
    gd             = ':lua vim.lsp.buf.definition()<cr>',
    gD             = ':lua vim.lsp.buf.declaration()<cr>',
    gI             = ':lua vim.lsp.buf.implementation()<CR>',
    gT             = ':lua vim.lsp.buf.type_definition()<CR>',
    gr             = ':lua vim.lsp.buf.references()<CR>',
    ['<leader>rr'] = ':lua vim.lsp.buf.rename()<CR>',
    ['<ctrl-h>']   = ':lua vim.lsp.buf.hover()<cr>',
    ['<leader>w']  = ':lua vim.lsp.buf.workspace_symbol()<CR>'
  },
  i = {
    ['<c-s>'] = '<c-o>:lua vim.lsp.buf.signature_help()<cr>',
    ['<c-j>'] = '<c-o>:lua require"luasnip".expand_or_jump()<cr>',
    ['<c-k>'] = {
      { noremap = false, expr = true},
      'luasnip#expand_or_jumpable() ? \'<cmd>lua require"luasnip".jump(-1)<cr>\' : "<c-k>"'
    }
  }
}

vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
