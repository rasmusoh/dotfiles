syntax on
set encoding=utf-8
filetype plugin indent on
set noerrorbells
colorscheme ir_black
set guifont=consolas:h12:
cd C:\users\bfpd\

"""""""""""""""""""""""
"""-----PLUGINS-----"""
"""""""""""""""""""""""
" 
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/goyo.vim'
call vundle#end()            

runtime macros/matchit.vim

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"" file search
set path+=**
set wildmenu

"" tags 
command! MakeTags !ctags -R .

"""""""""""""""""""""""
"""------SEARCH-----"""
"""""""""""""""""""""""
" 
"" search using ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" search settings
set ignorecase
set smartcase
set incsearch
set nohlsearch


"tab behaviour
filetype plugin indent on " show existing tab with 4 spaces width
set tabstop=4 " when indenting with '>', use 4 spaces width
set shiftwidth=4 " On pressing tab, insert 4 spaces
set expandtab
set number


"""""""""""""""""""""""
"""------DISPLAY----"""
"""""""""""""""""""""""
" soft word wrap
set wrap linebreak nolist
map j gj
map k gk
setglobal foldmethod=indent

"""""""""""""""""""""""
"""----MAPPINGS-----"""
"""""""""""""""""""""""

inoremap fd <Esc>
vnoremap fd <Esc>
let mapleader = "\<Space>"

"" map Enter
noremap <CR> o<Esc>
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>

" kill line
noremap K i<CR><Esc>k$
" cutting chars and visual paste doesnt write to register
noremap p "+p
noremap P "+P
vnoremap p "_c<Esc>"+p 
vnoremap P "_c<Esc>"+P
noremap c "_c
noremap cc "_cc
noremap C "_C
noremap x "_x
noremap X "_dd
" cut to clipboard
noremap d "+d
noremap dd "+dd
noremap D "+D
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

"""""""""""""""""""""""
"""-------GUI-------"""
"""""""""""""""""""""""
" if using gui, no scroll/menu/toolbar
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
