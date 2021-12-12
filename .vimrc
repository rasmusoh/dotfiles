set encoding=utf-8
scriptencoding utf-8
set vb
set t_vb=
set ignorecase
set smartcase
set hidden
set clipboard=unnamedplus,unnamed
set splitbelow
set nobackup  "get rid of *~ files
set nowritebackup
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
set number
let &t_TI = ""
let &t_TE = ""
set cmdheight=2 " Give more space for displaying messages.
set termguicolors
set updatetime=300
set shortmess+=c " Don't pass messages to ins-completion-menu
set signcolumn=number
set grepprg=rg\ --vimgrep
let g:netrw_banner=1
let g:netrw_altv=1
let g:netrw_liststyle=3

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'gioele/vim-autoswap'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'antoinemadec/coc-fzf'
Plug 'vim-scripts/ShaderHighLight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'habamax/vim-godot'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

let g:airline_powerline_fonts=1
color dracula
let g:airline_theme='dracula'
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:peekaboo_delay=300
let g:peekaboo_compact=1

map j gj
map k gk

noremap c "_c
noremap cc "_cc
noremap C "_C
vnoremap c "_c
vnoremap C "_C
xnoremap p pgvy
xnoremap P Pgvy

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

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <F12> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> <C-F12> <Plug>(coc-implementation)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <S-F12> <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

let mapleader = "\<Space>"
map <leader>=  :Format<CR>
map <Leader>a ggVG
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>g :Git<CR>
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>
nmap <leader>cr  <Plug>(coc-rename)
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>cq  <Plug>(coc-fix-current)
map <leader>r :Rg<CR>
map <Leader>s :w<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>ve :e ~/.vimrc<CR>
map <leader>vr :so ~/.vimrc<CR>
map <leader>y :Goyo<CR>

autocmd FileType markdown,text let b:coc_suggest_disable = 1
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

