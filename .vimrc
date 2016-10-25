syntax on
set encoding=utf-8

" VUNDLE

" Required Vundle setup
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " Vundle
Plugin 'scrooloose/nerdtree' "NERDTree (file browsing)
Plugin 'scrooloose/nerdcommenter' "NERDCommenter (comment util)
Plugin 'Valloric/YouCompleteMe' "YouCompleteMe (autocomplete)
Plugin 'ctrlpvim/ctrlp.vim' "CtrlP (fuzzy file finder)
Plugin 'morhetz/gruvbox' "Gruvbox (colorscheme)
Plugin 'mileszs/ack.vim' "Ack (fast file system search)
Plugin 'easymotion/vim-easymotion' "Easymotion (move around quickly)
Plugin 'vim-airline/vim-airline' "Airline (cool status bar)
Plugin 'tpope/vim-surround' "Surround (quoting/parenthesizing/html util)
Plugin 'tpope/vim-fugitive' "Fugitive (git wrapper)
Plugin 'jnurmine/Zenburn' "Zenburn (color theme)
Plugin 'rasmusoh/prosaic' "Prosaic (txt/md settings)
Plugin 'leafgarland/typescript-vim' "Typescript-vim (typescript syntax)
Plugin 'OrangeT/vim-csharp' "(csharp syntax)

call vundle#end()
filetype plugin indent on

" ACK -> AG
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" OS SPECIFIC SETTINGS
if has("win32")
    let g:ycm_path_to_python_interpreter="C:/Python27/python.exe"
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
else
" Fix Python Path (for YCM)
    let g:ycm_path_to_python_interpreter="/usr/bin/python2"
endif

" COLORSCHEME
if (!has("gui_running") && has("win32"))
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme zenburn
else
    colorscheme gruvbox
    set background=dark
endif

"WRIT MODE
nnoremap \ gqip
nnoremap <S-\> gggqG

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

" FIND REPLACE
command -nargs=* Jsreplace call JsreplaceFunction(<f-args>)
function JsreplaceFunction(arg1, arg2)
    execute '!echo "s/' . a:arg1 . '/' . a:arg2 . '/g"'
    execute '!find -name "*.js" -not -path "*/.git/*" -not -path "*/lib/*" -not -path "*/node_modules/*" | xargs sed -i "s/' . a:arg1 . '/' . a:arg2 . '/g"'
endfunction

"MAPPINGS
let mapleader = "\<Space>"
map<Leader>p viwp
map<Leader>y yiw
map<Leader>d "_d
map<Leader>t :NERDTreeToggle<CR>
map<Leader>w :%s/\s\+$//<CR> 
" autoindent
map<Leader>+ gg=G''zz
" quicksave
map<Leader>s :w<CR>
vmap<Leader>s <Esc>:w<CR>
" select all
noremap <C-A> ggVG 
" kill line
noremap K i<CR><Esc>k$
" copypaste	
vnoremap <C-S-C> "+y
vmap <C-S-V>       "+gP
noremap <C-S-X> "+x
cmap <C-S-V>      <C-R>+
" cutting chars and visual paste doesnt write to register
vnoremap p "_c<Esc>p 
noremap x "_x
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

" MISC
" clojure
let g:slimv_swank_clojure = '! xterm -e lein swank &' 
"close vim if only NERDTree left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" No autocontiuation of comments
set formatoptions-=cro
" IF USING GUI, NO SCROLL/MENU/TOOLBAR
set guioptions-=r  " no scrollbar on the right
set guioptions-=l  " no scrollbar on the left
set guioptions-=m  " no menu
set guioptions-=T  " no toolbar
