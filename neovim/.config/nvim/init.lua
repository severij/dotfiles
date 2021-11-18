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

vim.cmd('colorscheme gruvbox')

set_global_vars {
  mapleader = ' ',
  nvim_tree_width = 60,
  -- ['sneak#label'] = 1,
  -- ['sneak#use_ic_scs'] = 1
}

if vim.fn.executable('rg') then
  local rg_cmd = 'rg --vimgrep'
  set_options {
    grepprg = rg_cmd,
    grepformat = '%f:%l:%c:%m'
  }
end

map { n = {
    ['<Esc>']         = ':nohl<cr><Esc>',
    ['<leader>ff']    = ':lua require"config.telescope".find_files()<cr>',
    ['<leader>fF']    = ':lua require"config.telescope".find_files(true)<cr>',
    ['<leader>fg']    = ':lua require"config.telescope".live_grep()<cr>',
    ['<leader>fb']    = ':lua require"config.telescope".buffers()<cr>',
    ['<leader>f.']    = ':lua require"config.telescope".find_dotfiles()<cr>',
    ['<leader>st']    = ':terminal<cr>',
    ['<leader>qc']    = ':read !gcolor3<cr>',
    ['[h']            = ':GitGutterPrevHunk<cr>',
    [']h']            = ':GitGutterNextHunk<cr>',
    ['<leader>gg']    = ':Git<cr>',
    ['<leader>gb']    = ':Git blame<cr>',
    ['<leader>gl']    = ':Git log<cr>',
    ['<leader>gd']    = ':Gdiffsplit<cr>',
    ['<leader><Tab>'] = ':NvimTreeToggle<cr>',
    ['-']             = ':NvimTreeFindFile<cr>',
  },
  i = {
    ['<C-q>'] = '<C-r>=system("gcolor3")<cr>'
  }
}

vim.cmd('autocmd TermOpen * setlocal nonumber')
