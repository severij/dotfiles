require('helpers')
require('lsp_settings')

local packer_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(packer_path)) > 0 then
   cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_path)
   require('plugins')
   cmd('PackerCompile')
   cmd('PackerInstall')
else
   require('plugins')
end

cmd('filetype plugin indent on')
cmd('syntax enable')

opt('o', 'backspace', 'indent,eol,start')
opt('o', 'scrolloff', 5)
opt('o', 'sidescrolloff', 10)
opt('o', 'hidden', true)
opt('o', 'lazyredraw', true)
opt('o', 'history', 1000)
opt('o', 'termguicolors', true)
opt('o', 'pumblend', 15)
opt('o', 'winblend', 15)
opt('o', 'cursorline', true)
opt('o', 'inccommand', 'split')
opt('o', 'wrapscan', false)
opt('o', 'showmatch', true)
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'relativenumber', true)
opt('o', 'incsearch', true)
opt('o', 'hlsearch', true)
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

vim.cmd('colorscheme gruvbox')
opt('o', 'background', 'dark')

vim.g.mapleader = ' '

-- let g:sneak#label = 1
-- let g:sneak#use_ic_scs = 1
-- let g:sneak#target_labels = "ghfjdkslGHFJDKSLbntyBNTYqpa;QPA:"
--
-- let g:LanguageClient_useVirtualText = 'No'
-- let g:LanguageClient_serverCommands = {
--     \ 'python': ['pyls'],
--     \ 'c': ['clangd'],
--     \ 'cpp': ['clangd']
--     \ }
--
-- let mapleader = ' '
--
-- if executable('rg')
--   set grepprg=rg\ --vimgrep
--   set grepformat=%f:%l:%c:%m
-- else
--   let &grepprg='grep -n -R -i --exclude=' . shellescape(&wildignore) . ' $*'
-- endif
--
-- function! s:find_project_root()
--   let s:root_dir = system(' ')
--   if !empty(s:root_dir)
--     return s:root_dir[:-2]
--   endif
-- endfunction
--
-- function FindInDir(path, bang)
--   if !empty(a:path)
--     call fzf#vim#grep('rg --max-columns 120 --column --line-number --no-heading --color=always --smart-case -- '.shellescape(''), 0, fzf#vim#with_preview({'dir': a:path}), a:bang)
--   endif
-- endfunction
--
-- " command! -bang -nargs=1 -complete=dir FindInDir call FindInDir(<q-args>, <bang>0)
-- " command! -bang -nargs=0 FindInProject call FindInDir(s:find_project_root(), <bang>0)
--

map('', '<leader>ff', ':Files<cr>')
map('', '<leader>fb', ':Buffers<cr>')
map('', '<leader>fh', ':History<cr>')
map('', '<leader>gg', ':Git<cr>')
map('', '<leader>gb', ':Git blame<cr>')
map('', '<leader>gl', ':Git log<cr>')

-- let g:neoterm_autoinsert = 1
-- let g:neoterm_autoscroll = 1
-- nnoremap <leader>tt :Tnew<cr>
-- nnoremap <leader>tv :vert Tnew<cr>
-- nnoremap <leader>th :bel Tnew<cr>
-- tnoremap <C-w>c <C-\><C-n>:Tclose<cr>
--
-- " nnoremap <leader>fif :FindInFile<cr>
-- " nnoremap <leader>fid :FindInDir
-- " nnoremap <leader>fip :FindInProject<cr>
-- nnoremap <leader>gd <Plug>(lcn-definition)
--

