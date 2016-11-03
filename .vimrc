syntax on
set encoding=utf-8
filetype plugin indent on

"" OS SPECIFIC SETTINGS
if has("win32")
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
endif

" COLORSCHEME
if (!has("gui_running") && has("win32"))
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif

" SEARCH SETTINGS
set ignorecase
set smartcase
set incsearch
set nohlsearch

"TAB BEHAVIOUR
filetype plugin indent on " show existing tab with 4 spaces width
set tabstop=4 " when indenting with '>', use 4 spaces width
set shiftwidth=4 " On pressing tab, insert 4 spaces
set expandtab

"MAPPINGS
let mapleader = "\<Space>"
noremap <CR> o<Esc>
noremap <CR> O<Esc>
" kill line
noremap K i<CR><Esc>k$
" cutting chars and visual paste doesnt write to register
vnoremap p "_c<Esc>p 
vnoremap P "_c<Esc>P
noremap c "_c
noremap C "_C
noremap x "_x
noremap X "_dd
" cut to clipboard
noremap y "*y
noremap yy "*yy
noremap Y "*Y
" mapping so swedish keyboard will behave similarly
map ö ;
map Ö :
map ä '
map Ä "
map å [
map Å {
map ¤ $
map ¨ ]
map - /
map _ ?

" IF USING GUI, NO SCROLL/MENU/TOOLBAR
set guioptions-=r  " no scrollbar on the right
set guioptions-=l  " no scrollbar on the left
set guioptions-=m  " no menu
set guioptions-=T  " no toolbar
