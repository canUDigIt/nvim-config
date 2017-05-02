set nocompatible
filetype plugin on

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'

" Add plugins to &runtimepath
call plug#end()

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number
set relativenumber

syntax enable
set background=dark
colorscheme solarized

set incsearch
set hlsearch

if has('gui_running')
    set guifont=Hack:h11
endif
