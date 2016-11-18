syntax on
set encoding=utf-8
filetype plugin indent on
set noerrorbells
colorscheme ir_black
set guifont=consolas:h12

"" OS SPECIFIC SETTINGS
"if has("win32")
"    inoremap <Char-0x07F> <BS>
"    nnoremap <Char-0x07F> <BS>
" endif

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
inoremap fd <Esc>
vnoremap fd <Esc>
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

""spacemacs style mapping of Visual Studio commands
let mapleader=" "

map <Leader>/ :vsc Edit.FindInFiles<CR>

map <Leader>bn :vsc Window.NextTab<CR>
map <Leader>bN :vsc Window.NewWindow<CR>
map <Leader>bp :vsc Window.PreviousTab<CR>
map <Leader>bd :vsc Window.CloseDocumentWindow<CR>

map <Leader>en :vsc View.NextError<CR>
map <Leader>ep :vsc View.PreviousError<CR>

map <Leader>fs :vsc File.SaveSelectedItems<CR>

map <Leader>p% :vsc Edit.ReplaceInFiles<CR>
map <Leader>pc :vsc Build.BuildSolution<CR>
map <Leader>pm :vsc View.PackageManagerConsole<CR>
map <Leader>pt :vsc View.SolutionExplorer<CR>
map <Leader>pf :vsc Edit.NavigateTo<CR>

map <Leader>m= :vsc Edit.FormatDocument<CR>
map <Leader>mgg :vsc Edit.GoToDeclaration<CR>
map <Leader>mgt :vsc Edit.GoToDefinition<CR>
map <Leader>mgu :vsc Edit.FindAllReferences<CR>

map <Leader>w/ :vsc Window.NewVerticalTabGroup<CR>
map <Leader>w- :vsc Window.NewHorizontalTabGroup<CR>
map <Leader>wn :vsc Window.MovetoNextTabGroup<CR>
map <Leader>wp :vsc Window.MovetoPreviousTabGroup<CR>
map <Leader>wd :vsc Window.CloseDocumentWindow<CR>

map <C-g> :vsc Window.CloseToolWindow<CR>

" IF USING GUI, NO SCROLL/MENU/TOOLBAR
set guioptions-=r  " no scrollbar on the right
set guioptions-=l  " no scrollbar on the left:
set guioptions-=m  " no menu
set guioptions-=T  " no toolbar
