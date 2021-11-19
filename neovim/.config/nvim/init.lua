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
    ['gd']            = ':lua vim.lsp.buf.definition()<CR>',
    ['gD']            = ':lua vim.lsp.buf.declaration()<CR>',
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
    ['<c-s>'] = '<c-o>:lua vim.lsp.buf.signature_help()<cr>',
    ['<c-j>'] = '<c-o>:lua require"luasnip".expand_or_jump()<cr>',
    ['<c-k>'] = {
      { noremap = false, expr = true},
      'luasnip#expand_or_jumpable() ? \'<cmd>lua require"luasnip".jump(-1)<cr>\' : "<c-k>"'
    }
  }
}

--   inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>

-- -- Mappings
-- map {
--   n = {
--     ['[d'] = ':lua vim.lsp.diagnostic.goto_prev()<CR>',
--     [']d'] = ':lua vim.lsp.diagnostic.goto_next()<CR>',
--     ['<space><space>h'] = ':lua vim.lsp.buf.hover()<CR>',
--     ['<space><space>t'] = ':lua vim.lsp.buf.type_definition()<CR>',
--     ['<space><space>i'] = ':lua vim.lsp.buf.implementation()<CR>',
--     ['<space><space>r'] = ':lua vim.lsp.buf.references()<CR>',
--     ['<space><space>w'] = ':lua vim.lsp.buf.workspace_symbol()<CR>',
--     ['<space><space>R'] = ':lua vim.lsp.buf.rename()<CR>'
--   },
-- }

vim.cmd('autocmd TermOpen * setlocal nonumber')
