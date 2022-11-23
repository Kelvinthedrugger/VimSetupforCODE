" ' " '(quotation mark): means comment in vim script
" change filename to .vimrc in Linux/macOS 
" ref to source $VIMRUNTIME/.... on your machine 

" @geohot
syntax on
set nobackup
set tabstop=4
set shiftwidth=4
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

"auto close brackets; kinda lame
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
" [] also
inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []

" yep, use ()
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()



" auto indent? very smooth!
" http://wiki.csie.ncku.edu.tw/vim/vimrc?printable
filetype indent on

"fold: provided feature in vim
"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END

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
autocmd BufWrite *.py, *.txt, *.c, *.cpp :call DeleteTrailingWS()


"allowing backspace key
set backspace=indent,eol,start  " more powerful backspacing

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-]> g<C-]>

set mouse=a

" Press Enter to highlight current word
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> Highlighting()

" wildmenu for easier navigating
set wildmenu

" useful tag method, after creating tags -> uncomment this line
"set tags=./tags;,tags$HOME

" fold doc strings, not working if foldmethod is not activated
"let g:SimplyFold_docstring_preview=1


