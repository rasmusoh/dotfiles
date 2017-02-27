syntax on
set encoding=utf-8
filetype plugin indent on
set noerrorbells
set hidden
set clipboard=unnamedplus

"""""""""""""""""""""""
"""-----PLUGINS-----"""
"""""""""""""""""""""""
" 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'epeli/slimux'
Plugin 'ap/vim-css-color'
Plugin 'dhruvasagar/vim-table-mode'
call vundle#end()

runtime macros/matchit.vim

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
""let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"" file search
set path+=**
set wildmenu

"" tags 
command! MakeTags !ctags -R .
command! MakeTagsJS !find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags
set omnifunc=syntaxcomplete#Complete

map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
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

"""""""""""""""""""""""
"""------DISPLAY----"""
"""""""""""""""""""""""
" soft word wrap
set wrap linebreak nolist
set display+=lastline
map j gj
map k gk
set foldmethod=indent
set foldlevel=20

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif            

colorscheme ir_black

"""""""""""""""""""""""
"""-------GUI-------"""
"""""""""""""""""""""""
" if using gui, no scroll/menu/toolbar
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=consolas:h12:

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



"" CUT A AND PASTE
" x and c doesnt write to register
noremap c "_c
noremap cc "_cc
noremap C "_C
vnoremap c "_c
vnoremap C "_C

noremap x "_x
noremap X "_dd
vnoremap x "_d
vnoremap X "_d

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
