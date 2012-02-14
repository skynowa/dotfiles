set lines=75
set columns=240
" set gfn=Menlo\ Regular:h12
set guioptions=egmrt
set showtabline=2
set t_Co=256

colorscheme ir_black

if &background == "dark"
  hi normal guibg=black
  set transp=12
endif

map <silent> <leader>F :set fullscreen!<CR>
map <silent> <leader>F <Esc>:set fullscreen!<CR>
