" -----------------------------------------------------------------------------
" Enable Pathogen for bundling of plugin repos
" -----------------------------------------------------------------------------

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Windows compatibility (blech)
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" -----------------------------------------------------------------------------
" Functionality
" -----------------------------------------------------------------------------

" Disable Vi compatibility
set nocompatible

" Automatically detect file types
filetype plugin indent on

" Disable backups *hard-core*
set nobackup
set nowritebackup

" Set history to 100
set history=100

" Support these files
set ffs=unix,dos,mac

" Display incomplete commands
set showcmd

" No noise.
set noerrorbells

" Always show status line.
set laststatus=2

" Enable mouse
set selectmode=mouse
set mouse=a

" Use 2 spaces for tabs, turn on automatic indenting
set tabstop=2

" Enable smart tabs
set smarttab

" Shift by 2
set shiftwidth=2

" Round whitespace to ensure we keep our tab/space widths
set shiftround

" Auto-indent code
set autoindent
set expandtab

" Wrap at 80 chars by default
set textwidth=80

" Set backspaces to work properly (intelligent for indentation)
set backspace=start,eol,indent

" Make backspace work the way it should
set backspace=2

" Make backspace and cursor keys wrap accordingly
set whichwrap+=<,>,h,l

" Make searches case-insensitive
set ignorecase

" ... unless search phrase explicitly contains uppercase letter(s)
set smartcase

" Set title to show current filename
set title

" Folding settings
set foldmethod=indent  " Base on indentation
set foldnestmax=10     " Allow a max fold depth of 10 levels
set nofoldenable       " Don't fold by default
set foldlevel=1        "

" Pesky swap file @.@
set noswapfile

" Ensure UTF-8
set encoding=utf-8 nobomb
scriptencoding utf-8

" -----------------------------------------------------------------------------
" Visual
" -----------------------------------------------------------------------------

" Show position in file
set ruler

" No blinking .
set novisualbell

" ... dynamically as they are typed (incremental).
set incsearch

" Enable line numbers
set number

" Show mathing braces
set sm

" Set column colour to -2 of text width (creating a visual line)
set colorcolumn=-2

" Do not highlight search result phrases
set nohlsearch

" Show line status
set ls=2

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  " Enable syntax highlighter
  syntax on
  " Highlight search terms
  set hlsearch
endif

if has("gui_running")
  " Grow to maximum horizontal width on entering fullscreen mode
  set fuopt+=maxhorz
  " free up Command-F
  macmenu &Edit.Find.Find\.\.\. key=<nop>
  set guioptions-=m
  set guioptions-=T
  " Enable tranparency
  set transparency=15
  " Set dark background for our theme of choice
  set background=dark
  " Choose colour scheme
  colorscheme ir_black
  "set lines=40
  "set columns=80
endif

" -----------------------------------------------------------------------------
" Aliases, functions, shortcuts, etc.
" -----------------------------------------------------------------------------

" Set leader to comma
let mapleader = ","

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace ()<CR>

" Make editing .vimrc easier
map <leader>v :sp ~/.vimrc<CR>
map <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Set up command for NERDTree
map <leader>n :NERDTree<CR>

" Toggle fullscreen mode
map <D-f> :set invfu<CR>

" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<

" The following will make tabs and trailing spaces visible when requested
set listchars=trail:.,tab:>-,eol:$
set nolist

" Toggle invisible chars
:noremap ,i :set list!<CR>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete
  " May require ruby compiled in
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
else
  " Always set autoindenting on
  set autoindent
endif

" -----------------------------------------------------------------------------
" NERDTree plugin settings
" -----------------------------------------------------------------------------

"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>

"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Show hidden (dot) files
let NERDTreeShowHidden=1
