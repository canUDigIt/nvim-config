filetype plugin on

let g:python3_host_prog='C:/Users/tracy.brown/environments/neovim3/Scripts/python.exe'
let g:python_host_prog='C:/Users/tracy.brown/environments/neovim/Scripts/python.exe'

call plug#begin('~/.vim/plugged')

" Navigational plugins
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'

" Code plugins
Plug 'roxma/nvim-completion-manager'
Plug 'tpope/vim-surround'
Plug 'townk/vim-autoclose'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Visual plugins
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'morhetz/gruvbox'
Plug 'KeitaNakamura/neodark.vim'
Plug 'romainl/Apprentice'
Plug 'icymind/NeoSolarized'

" C++ plugins
Plug 'arakashic/chromatica.nvim'
Plug 'vim-scripts/a.vim'
Plug 'roxma/ncm-clang'

" SVN Plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Add plugins to &runtimepath
call plug#end()

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number
set relativenumber

syntax enable
set termguicolors
set background=dark
colorscheme neodark

set incsearch
set hlsearch

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

let g:chromatica#libclang_path='C:/Program Files/LLVM/bin/libclang.dll'
let g:chromatica#enable_at_startup=1
