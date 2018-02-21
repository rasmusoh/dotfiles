imap fd <esc>
vmap fd <esc>
set ignorecase
set smartcase
set hidden
set clipboard^=unnamed,unnamedplus
set splitbelow
set path+=**
set tabstop=4 " when indenting with '>', use 4 spaces width
set shiftwidth=4 " On pressing tab, insert 4 spaces
set expandtab
set wrap linebreak nolist " soft word wrap
set display+=lastline
set foldmethod=indent
set foldlevel=20

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gioele/vim-autoswap'
Plug 'airblade/vim-rooter'
Plug 'junegunn/goyo.vim'
Plug 'jremmen/vim-ripgrep'
"Plug 'valloric/YouCompleteMe'
"Plug 'scrooloose/syntastic'
call plug#end()

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()} 
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_rust_checkers = ['rustc']

let g:netrw_banner=0        " disable annoying banner
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

colorscheme ir_black

" if using gui, no scroll/menu/toolbar
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=consolas:h12:

let mapleader = "\<Space>"

map j gj
map k gk

"c and visual paste doesnt write to register
noremap c "_c
noremap cc "_cc
noremap C "_C
vnoremap c "_c
vnoremap C "_C
xnoremap p pgvy
xnoremap P Pgvy

" mapping so swedish keyboard will behave similarly
map ö ;
map Ö :
map ä '
map Ä "
map å [
map Å {
map ¤ $
map ¨ ]
noremap - /
noremap _ ?
