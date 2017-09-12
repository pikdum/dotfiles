"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.local/share/dein')
  call dein#begin('$HOME/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Plugins
  call dein#add('scrooloose/nerdtree')
  call dein#add('chriskempson/base16-vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('itchyny/lightline.vim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('guns/vim-clojure-static')
  call dein#add('kien/rainbow_parentheses.vim')
  call dein#add('tpope/vim-fireplace')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-commentary')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('wesQ3/vim-windowswap')
  " call dein#add('Shougo/deoplete.nvim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" let g:deoplete#enable_at_startup = 1

" some visible whitespace
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

let mapleader = ","

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" nerdtree junk
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrows=0


set colorcolumn=80
set relativenumber

" turn on rainbox parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Also switch on highlighting the last used search pattern.
set hlsearch

" I like highlighting strings inside C comments.
let c_comment_strings=1

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  autocmd FileType text setlocal textwidth=78 softtabstop=0 tabstop=2 expandtab shiftwidth=2 smarttab
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  " autocmd FileType vue setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
  autocmd FileType vim setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
  autocmd FileType html setlocal shiftwidth=2 tabstop=2
  autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
  autocmd FileType sql setlocal shiftwidth=1 tabstop=1 expandtab smarttab

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

set title
set titlestring="vim: %t"
