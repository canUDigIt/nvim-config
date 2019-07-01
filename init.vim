filetype plugin on

call plug#begin('~/.vim/plugged')

" Code plugins
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/echodoc.vim'
Plug 'sheerun/vim-polyglot'
Plug 'pboettch/vim-cmake-syntax'
Plug 'NLKNguyen/c-syntax.vim'

" Navigational plugins
Plug 'srstevenson/vim-picker'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-startify'
Plug 'philip-karlsson/bolt.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'philip-karlsson/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }

" Visual plugins
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'
Plug 'andreypopp/vim-colors-plain'
Plug 'fenetikm/falcon'

" C++ plugins
Plug 'vim-scripts/a.vim'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" SVN Plugins
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

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
colorscheme falcon

let g:lightline = { 'colorscheme': 'falcon' }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'relativepath', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }

set incsearch
set hlsearch

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nmap <leader>t <Plug>(PickerEdit)
nmap <leader>b <Plug>(PickerBuffer)
nmap <leader>h <Plug>(PickerHelp)

nmap <Leader>as <Plug>(AerojumpSpace)
nmap <Leader>ab <Plug>(AerojumpBolt)
nmap <Leader>aa <Plug>(AerojumpFromCursorBolt)
nmap <Leader>ad <Plug>(AerojumpDefault)

set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg', 'ag']

" Search for the current word
nnoremap <leader>* :GrepperRg -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Required for operations modifying multiple buffers like rename.
set hidden

nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lr <Plug>(coc-rename)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>lx <Plug>(coc-references)
nmap <silent> <leader>la <Plug>(coc-codeaction-selected)
vmap <silent> <leader>la <Plug>(coc-codeaction-selected)
nmap <silent> <leader>lf <Plug>(coc-format-selected)
vmap <silent> <leader>lf <Plug>(coc-format-selected)
nmap <silent> <leader>lh :call CocActionAsync('doHover')<cr>
nn <silent> <leader>ls :<C-u>CocList outline<cr>
nn <silent> <leader>lm :<C-u>CocList commands<cr>

nn xx x
