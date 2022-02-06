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


