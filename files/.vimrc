" Enable Rightclick=Paste
set mouse-=a

" Show line numbers 
set number

" Enable Syntax Highlighting
syntax on

" Show file stats
 set ruler

" Encoding
set encoding=utf-8

" How many spaces shall be visualized for TAB
set tabstop=2

" Number of spaces with with TAB
set softtabstop=2

" Tabs are spaces
set expandtab

" show command in bottom bar
" set showcmd

" Highlight the current line
set cursorline

" visual autocomplete for the command menu 
set wildmenu

" Highlight matching of () [] etc.
set showmatch

" search as characters are entered
set incsearch

" highlight search matches
set hlsearch

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]
