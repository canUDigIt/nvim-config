filetype plugin on

call plug#begin('~/.vim/plugged')

" Navigational plugins
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" Code plugins
Plug 'valloric/youcompleteme'
Plug 'rdnetto/ycm-generator', { 'branch': 'stable'}
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'

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
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/a.vim'

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
colorscheme onedark

set incsearch
set hlsearch

let g:cpp_class_scope_highlight = 1

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

set wildignore+=*/.git/*,*/tmp/*,*.swp
