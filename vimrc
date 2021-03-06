" Disable Vi compatibility
set nocompatible

" ------------------------------------------------------------------------------
" Enable Pathogen for bundling of plugin repos
" ------------------------------------------------------------------------------

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" Windows compatibility *blech*
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" ------------------------------------------------------------------------------
" Core Functionality
" ------------------------------------------------------------------------------

" Automatically detect file types
filetype plugin indent on

" Disable backups *hard-core*
set nobackup
set nowritebackup

" Disable pesky swap files @.@
set noswapfile

" Set history and undo levels to 500
set history=500
set undolevels=500

" If running 7.3+, enable the wonderful new persistent undo, which enables
" you to undo/redo even if buffer is unloaded or even closed. Plus, now
" you are able to undo even after buffer reload
if version >= 703
  set undofile
  set undodir=/tmp
endif

" Ignore unwanted filetypes for filename autocompletion via tab
set wildignore=*.swp,*.bak

" Support these files
set ffs=unix,dos,mac

" Display incomplete commands
set showcmd

" No noise
set noerrorbells

" Enable mouse
set selectmode=mouse
set mouse=a

" Make searches case-insensitive...
set ignorecase

" ...unless search phrase explicitly contains uppercase letter(s)
set smartcase

" Always show status line.
set laststatus=2

" Ensure UTF-8
set encoding=utf-8 nobomb
scriptencoding utf-8

" Create a mapping to for paste mode via toggle with F2, because pasting
" directly from the clipboard in insert mode sucks
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Display current mode
set showmode

" When the page starts to scroll, keep the cursor 3 lines from the top and 3
" lines from the bottom
set scrolloff=3

" ------------------------------------------------------------------------------
" Visual Settings
" ------------------------------------------------------------------------------

" Show position in file
set ruler

" Set title to show current filename
set title

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

" Set backspaces to work properly (intelligent for indentation)
set backspace=start,eol,indent

" Make backspace work the way it should
set backspace=2

" Make backspace and cursor keys wrap accordingly
set whichwrap+=<,>,h,l

" Wrap at 80 chars by default
set textwidth=80

" Base folding on indentation
set foldmethod=indent

" Allow a max fold depth of 10 levels
set foldnestmax=10

" Don't fold by default
set nofoldenable

set foldlevel=1

" turn off error beep/flash
set visualbell t_vb=

" No blinking .
set novisualbell

" Enable line numbers
set number

" Show matching braces
set sm

" Set column colour to -2 of text width (creating a visual line)
if version >= 703
  set colorcolumn=80
endif

" Search for words dynamically as they are typed
set incsearch

" Enable highlight searching
set hlsearch

" Show line status
set ls=2

" Enable syntax highlighter when colours are enabled
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" If 256 Colour is supported and enabled
if &t_Co >= 256 || has("gui_running")
  " Delicious, even in 256 colours!
  colorscheme tomorrow-night
  " Set colour for colorcolumn if Vim version >= 703
  if version >= 703
    highlight ColorColumn ctermbg=Black guibg=#111111
  endif
endif

" If GUI is running (settings usually found in .gvimrc)
if has("gui_running")
  " Grow to maximum horizontal width on entering fullscreen mode
  set fuoptions=maxvert,maxhorz
  " Remove menu bar
  set guioptions-=m
  " Remove toolbar
  set guioptions-=T
  " Remove right-hand scroll bar
  set guioptions-=r
  au GUIEnter * set fullscreen
endif

" ------------------------------------------------------------------------------
" Set Mapleader (beginning functions, assignments, etc.)
" ------------------------------------------------------------------------------

" Set leader to comma
let mapleader = ","

" ------------------------------------------------------------------------------
" NERDTree plugin settings
" ------------------------------------------------------------------------------

" Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>

" Show hidden (dot) files
let NERDTreeShowHidden=1

" Show bookmarks by default
let NERDTreeShowBookmarks=1

" ------------------------------------------------------------------------------
" Aliases, functions, shortcuts, mappings, remapping, etc.
" ------------------------------------------------------------------------------

" The first few of these inspired by http://nvie.com/posts/how-i-boosted-my-vim/

" Remap ; to : for quicker commands and saves, etc.
nnoremap ; :

" The following forces a user to use Vim movement keys as intended (disabling
" arrow key movement). If you prefer to allow this form of movement within Vim
" comment the following four lines.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" From Steve Losh, http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN
" Save as SUDO after a file has already been opened as a regular user
cmap w!! w !sudo tee % >/dev/null

noremap <leader>ss :call StripWhitespace ()<CR>

" Clear trailing whitespace on save
if has('autocmd')
  autocmd BufWritePre * :%s/\s\+$//e
endif

" Make editing .vimrc easier
map <leader>v :sp ~/.vimrc<CR>

" When vimrc is edited, reload it
if has('autocmd')
  autocmd! bufwritepost vimrc source ~/.vimrc
endif

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
:noremap <leader>i :set list!<CR>

" Set TagBar
nmap <F8> :TagbarToggle<CR>

" Set up alignment shortcuts for Tabularize when in visual or normal mode to
" align by either = or :
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Set up automatic Tabularize mapping when insert mode so that, for instance,
" while you are coding and you press the pipe (|) key, tabularize will be
" activated
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Functions to insert `=` characters up to 80th column
function! InsertH1Line()
  let n = 80-virtcol('.')
  let myline = repeat('=', n)
  return myline
endfunction
inoremap <expr> <C-o> InsertH1Line()

" Functions to insert `-` characters up to 80th column
function! InsertH2Line()
  let n = 80-virtcol('.')
  let myline = repeat('-', n)
  return myline
endfunction
inoremap <expr> <C-p> InsertH2Line()

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
if has('ruby')
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete
  if has('ruby')
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  endif
endif
