imap fd <esc><esc>
vmap fd <esc>
set ignorecase
set smartcase
set hidden
set clipboard^=unnamed,unnamedplus
set splitbelow
set nobackup  "get rid of *~ files
set noundofile "get rid of *un~ files
set path+=** " find recursively
set wildignore+=*.zip,*.png,*.jpg,*.gif,*.pdf,*DS_Store*,*/.git/*,*/node_modules/*,*/build/*,package-lock.json
set tabstop=4 " when indenting with '>', use 4 spaces width
set shiftwidth=4 " On pressing tab, insert 4 spaces
set expandtab
set wrap linebreak nolist " soft word wrap
set display+=lastline
set foldmethod=indent
set foldlevel=20

set grepprg=rg\ --vimgrep

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
Plug 'tpope/vim-commentary'
Plug 'gioele/vim-autoswap'
Plug 'junegunn/goyo.vim'
Plug 'wesgibbs/vim-irblack'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
call plug#end()

let g:ale_linters = {
\   'javascript': ['eslint'],
\}
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

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
map <Leader>v ggVG
map <Leader>= mxgg=G`xzz
map <Leader>f :Files<CR>
map <Leader>gf :GFiles<CR>
map <Leader>b :Buffers<CR>
nnoremap <silent> <leader>y :call system('/mnt/c/Windows/System32/clip.exe', @0)<CR>
vnoremap <silent> <leader>y :call system('/mnt/c/Windows/System32/clip.exe', @0)<CR>
nnoremap <silent> <leader>p :r !/mnt/c/Windows/System32/paste.exe<CR>
vnoremap <silent> <leader>p :r !/mnt/c/Windows/System32/paste.exe<CR>gvd
noremap c "_c
noremap cc "_cc
noremap C "_C
vnoremap c "_c
vnoremap C "_C
xnoremap p pgvy
xnoremap P Pgvy

" completion selection list
noremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

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
