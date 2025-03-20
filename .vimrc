" upload date: 1:33 a.m. 07/16/23
"unlet! skip_defaults_vim
"source $VIMRUNTIME/defaults.vim
"packadd! matchit

"allowing backspace key
set backspace=indent,eol,start  " more powerful backspacing

" by source $VIMRUNTIME/.... (?

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

" wildmenu for easier navigating
set wildmenu
" from @ezyang
set incsearch
set wildmode=list:longest
" make clipboard the same as system clipboard
set clipboard=unnamed
" end of @ezyang

" auto set tabstop & shiftwidth to 2 when open .py files
" idk if it's working, these didn't change when open .py on macOS
"autocmd BufReadPost *.py | set tabstop=2 | set shiftwidth=2
"autocmd BufReadPre *.py | set tabstop=2 | set shiftwidth=2
" this works (tho the rules in .vimrc are still confusing)
autocmd VimEnter *.py | set tabstop=2 | set shiftwidth=2


"start from last editing position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"i don't need .swp file
set noswapfile

"try color other than default
"colorscheme slate

"map ':tabnew' to 't' under normal mode 
nnoremap t :tabnew

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

" auto indent? very smooth!
" http://wiki.csie.ncku.edu.tw/vim/vimrc?printable
" comment out filetype indent when using vundle
" filetype indent on

" vundle, i would say it's not particularly useful
set nocompatible " be iMproved, required
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'preservim/nerdtree'
  " Plugin 'ggreer/the_silver_searcher'
  " markdown previewer
  Plugin 'iamcco/markdown-preview.nvim'
call vundle#end()
filetype plugin indent on " required
" end vundle

" start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
" start NERDTree when Vim starts with a directory argument.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" simply map NERDTree to key bindings suits my use-case the most
nnoremap <C-F> :NERDTree<CR>

" If another buffer tries to replace NERDTree, put it in the other window, and
" bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | 
  \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" https://www.maketecheasier.com/comment-multiple-lines-vim/
" we'll go with:
" comment..    :s/^/#  "in python
" uncomment..  :s/^#/  "in python as well

" hit shift+8 (aka, *) to iterate thru the selected word


" vim setup from jserv's course
" https://hackmd.io/@sysprog/gnu-linux-dev/https%3A%2F%2Fhackmd.io%2Fs%2FHJv9naEwl
"set cursorline " i found this very annoying
set enc=utf8
"set relativenumber " i guess i'm not a pure computer nerd
set ic " search non-case-sensitively

"Ctrl + N in insert mode for auto complete

" autocomplete dropdown list colorscheme
" https://hackmd.io/@sysprog/HJv9naEwl
hi Pmenu ctermfg=0 ctermbg=7 
hi PmenuSel ctermfg=7 ctermbg=4

" https://github.com/uranusjr/dotfiles/blob/master/files/vimrc#L267
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" autocmd BufWrite *.txt :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()


"set foldmethod=indent
" fold method done, which i'm not really used to
"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-]> g<C-]>

"terminal mode navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

"navigate between tabs
"gt: go to next tab
"gT: go to previous tab

" not really useful for me ?
" aka idk how to use this
"set mouse=a

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

" view edit history
" or, should we call this command prompt in vim ?
" 'q' + Shift + ':'
