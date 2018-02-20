imap fd <esc>
set ignorecase
set smartcase
set hidden
set clipboard^=unnamed

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
Plug 'jremmen/vim-ripgrep'
Plug 'OmniSharp/omnisharp-vim'
call plug#end()
