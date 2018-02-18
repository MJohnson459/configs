call plug#begin('~/vimfiles/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'ap/vim-css-color'
  Plug 'bling/vim-airline'
  Plug 'cespare/vim-toml'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'edkolev/tmuxline.vim'
  Plug 'ervandew/supertab'
  Plug 'flazz/vim-colorschemes'
  Plug 'godlygeek/tabular'
  Plug 'honza/vim-snippets'
  Plug 'jnurmine/zenburn'
  Plug 'majutsushi/tagbar'
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'scrooloose/syntastic'
  Plug 'sirver/ultisnips'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'valloric/youcompleteme'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
call plug#end()


" Stop beeping
set noeb vb t_vb=

" store backup, undo, and swap files in temp directory
set directory=$HOME/vimfiles/temp//
set backupdir=$HOME/vimfiles/temp//
set undodir=$HOME/vimfiles/temp//

" Persistent undo
set undofile
set undodir=$HOME/vimfiles/undo

set undolevels=1000
set undoreload=10000

" Syntax
syntax on
filetype plugin indent on


set background=dark
colorscheme anderson

set number
set relativenumber
set encoding=utf-8
set ff=unix

" Show whitespace
set list

" Tab size
set expandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2
set smarttab

" Ignores for Ctrl P
set wildignore+=**/node_modules
set wildignore+=**/tmp/cache
set wildignore+=*.pyc
set wildignore+=*.swp


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'
let g:airline_powerline_fonts = 1

" vim JSX (React)
let g:jsx_ext_required = 0

" Keybindings
let mapleader = ","

nmap <F8> :TagbarToggle<CR>
nmap <leader>nn :NERDTreeToggle<CR>

nmap <F4> :w<CR>:Dispatch<CR><CR>:cw<CR>

" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""
" Vim LSP
"""""""""""""""""""""""
" Keybindings
nmap <F11> :LspHover<CR>
nmap <F12> :LspDefinition<CR>

" Languages
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

