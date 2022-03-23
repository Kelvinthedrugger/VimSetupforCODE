" ' " '(quotation mark): means comment in vim script
" change filename to .vimrc in Linux/macOS 

" ref to source $VIMRUNTIME/.... on your machine 

" @geohot
syntax on
set nobackup
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
highlight Comment ctermfg=green

"i don't need .swp file
set noswapfile

"start from last editing position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"color other than default
colorscheme slate

"provided feature in vim
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" vim setup from jserv's course
" https://hackmd.io/@sysprog/gnu-linux-dev/https%3A%2F%2Fhackmd.io%2Fs%2FHJv9naEwl
"set cursorline
set enc=utf8
"set relativenumber
set ic " search non-case-sensitively


" https://github.com/uranusjr/dotfiles/blob/master/files/vimrc#L267
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()


" jeremy howard's tags for jumping around when browsing source code
"set tags=./tags;,tags$HOME
"set tags+=$HOME/site-packages/torch/tags
"set tags+=$HOME/site-packages/torchvision/tags



