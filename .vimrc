imap fd <esc><esc>
vmap fd <esc>
set encoding=utf-8
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
set spelllang=sv_se
set backupcopy=yes

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
Plug 'tpope/vim-eunuch'
Plug 'gioele/vim-autoswap'
Plug 'junegunn/goyo.vim'
Plug 'wesgibbs/vim-irblack'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'l04m33/vlime', {'rtp': 'vim/'}
"Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'dylanaraps/wal.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'vim-scripts/ShaderHighLight'
call plug#end()

"autocmd BufRead,BufNewFile *.shader set filetype=hlsl

let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'cs': ['OmniSharp']
            \}

let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

let g:netrw_banner=1        " disable annoying banner
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


" omnisharp
augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1
