let vimdir = "~/.vim"

call plug#begin($vimdir . '/plugged')
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

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Stop beeping
set noeb vb t_vb=
set tm=500

" store backup, undo, and swap files in temp directory
set directory=$vimdir . '/backup//'
set backupdir=$vimdir . '/backup//'
set undodir=$vimdir . '/undo//'

set undofile
set undolevels=1000
set undoreload=10000

" Syntax
syntax on
filetype plugin indent on

set background=dark
colorscheme anderson
" colorscheme solarized
" let g:solarized_termcolors=256

set encoding=utf-8
set ff=unix

" Show whitespace characters
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:·
if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
    set listchars=tab:⇥\ ,trail:␣,extends:⇉,precedes:⇇,nbsp:⚭
    set fillchars=vert:╎,fold:·
endif
set list

set wildmenu " Turn on the WiLd menu

" Tab size
set expandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2
set smarttab


" Search
set number
set relativenumber
set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set hlsearch   " Highlight search results
set incsearch  " Makes search act like search in modern browsers
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic      " For regular expressions turn magic on
set showmatch  " Show matching brackets when text indicator is over them
set mat=2      " How many tenths of a second to blink when matching brackets



" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'
let g:airline_powerline_fonts = 1

" vim JSX (React)
let g:jsx_ext_required = 0


""""""""""""""""
" NERDCommenter
""""""""""""""""
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


""""""""""""""""""""""""""""""
" => CTRL-P
" """"""""""""""""""""""""""""""
" let g:ctrlp_working_path_mode = 0
"
" let g:ctrlp_map = '<c-f>'
" map <leader>j :CtrlP<cr>
" map <c-b> :CtrlPBuffer<cr>
"
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee\|release'

set wildignore+=**/node_modules
set wildignore+=**/tmp/cache
set wildignore+=*.pyc
set wildignore+=*.swp

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.swp
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,**/node_modules,**/tmp/cache
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

""""""""""""""""""""
" General Keybinding
""""""""""""""""""""

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

nmap <F8> :TagbarToggle<CR>
nmap <F4> :w<CR>:Dispatch<CR><CR>:cw<CR>


"""""""""""""""""""""
" Misc
""""""""""""""""""""
nnoremap <Leader><Space> :let @/=""<cr>

let g:vim_markdown_folding_disabled = 1
au BufReadPost *.launch set syntax=xml

" User defined commands
nmap <leader>um :!java -jar ~/.plantuml/plantuml.jar %<CR>

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

if executable('docker-langserver')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'docker-langserver',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
    \ 'whitelist': ['dockerfile']
    \ })
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif



if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
elseif executable('app')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['app']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/path/to/cquery/cache' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
      \ })
endif
