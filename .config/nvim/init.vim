call plug#begin('~/.local/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'wellle/targets.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'kassio/neoterm'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
call plug#end()

filetype plugin indent on
syntax enable
set belloff=all
set backspace=indent,eol,start
set complete-=i
set wildmenu
set scrolloff=5 sidescrolloff=10
set hidden
set ruler
set lazyredraw
set encoding=utf-8
set history=1000
set termguicolors
set pumblend=15 winblend=15
set exrc
set secure
set listchars=tab:-->,trail:.,eol:$,extends:>,precedes:<,nbsp:~
set cursorline
set inccommand=split
set nowrapscan
set showmatch
set number relativenumber
set switchbuf=useopen,usetab
set incsearch hlsearch
set ignorecase smartcase
set autoindent
set smarttab expandtab tabstop=4 shiftwidth=4 
set undofile
set directory=.
set textwidth=80 colorcolumn=+1
set noequalalways
set splitright splitbelow
set mouse=a

colorscheme gruvbox
set background=light

let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#target_labels = "ghfjdkslGHFJDKSLbntyBNTYqpa;QPA:"

let g:LanguageClient_useVirtualText = 'No'
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd']
    \ }

let mapleader = ' '

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
else
  let &grepprg='grep -n -R -i --exclude=' . shellescape(&wildignore) . ' $*'
endif

function! s:find_project_root()
  let s:root_dir = system(' ')
  if !empty(s:root_dir)
    return s:root_dir[:-2]
  endif
endfunction

function FindInDir(path, bang)
  if !empty(a:path)
    call fzf#vim#grep('rg --max-columns 120 --column --line-number --no-heading --color=always --smart-case -- '.shellescape(''), 0, fzf#vim#with_preview({'dir': a:path}), a:bang)
  endif
endfunction

" command! -bang -nargs=1 -complete=dir FindInDir call FindInDir(<q-args>, <bang>0)
" command! -bang -nargs=0 FindInProject call FindInDir(s:find_project_root(), <bang>0)

let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
nnoremap <leader>tt :Tnew<cr>
nnoremap <leader>tv :vert Tnew<cr>
nnoremap <leader>th :bel Tnew<cr>
tnoremap <C-w>c <C-\><C-n>:Tclose<cr>

nnoremap <leader>ff :Files<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fh :History<cr>
" nnoremap <leader>fif :FindInFile<cr>
" nnoremap <leader>fid :FindInDir 
" nnoremap <leader>fip :FindInProject<cr>
nnoremap <leader>gd <Plug>(lcn-definition)

nnoremap <leader>gg :Git<cr>
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gl :Git log<cr>
