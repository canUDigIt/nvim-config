filetype plugin on

set encoding=utf-8

let g:python_host_prog  = 'C:\Python27\python.exe'
let g:python3_host_prog = 'C:\Python35\python.exe'

call plug#begin('~/.vim/plugged')

" Navigational plugins
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Code plugins
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-clang'
  Plug 'arakashic/chromatica.nvim'
else
  Plug 'maralla/completor.vim'
endif
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale'

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
colorscheme neodark

set incsearch
set hlsearch

let g:cpp_class_scope_highlight = 1

set wildignore+=*/.git/*,*/tmp/*,*.swp

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#clang#libclang_path = 'C:\LLVM\bin\libclang.dll'
  let g:doeplete#sources#clang#clang_header = 'C:\LLVM\lib\clang'

  let g:chromatica#libclang_path = 'C:\LLVM\bin\libclang.dll'
  let g:chromatica#enable_at_startup = 1
else
  let g:completor_clang_binary = 'C:\LLVM\bin\clang.exe'
endif

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
