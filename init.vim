filetype plugin on

call plug#begin('~/.vim/plugged')

" Navigational plugins
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-startify'

" Code plugins
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
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

" Visual plugins
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'morhetz/gruvbox'
Plug 'KeitaNakamura/neodark.vim'
Plug 'romainl/Apprentice'
Plug 'icymind/NeoSolarized'
Plug 'lifepillar/vim-solarized8'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'

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
colorscheme PaperColor

let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

let g:lightline = { 'colorscheme': 'PaperColor' }

set incsearch
set hlsearch

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nmap <leader>t :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>

set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg', 'ag']

" Search for the current word
nnoremap <leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Required for operations modifying multiple buffers like rename.
set hidden

function! SetLSPShortcuts()
  nmap <silent> <leader>ld <Plug>(coc-definition)
  nmap <silent> <leader>lr <Plug>(coc-rename)
  nmap <silent> <leader>lf <Plug>(coc-format-selected)
  vmap <silent> <leader>lf <Plug>(coc-format-selected)
  nmap <silent> <leader>lt <Plug>(coc-type-definition)
  nmap <silent> <leader>lx <Plug>(coc-references)
  nmap <silent> <leader>la <Plug>(coc-codeaction-selected)
  vmap <silent> <leader>la <Plug>(coc-codeaction-selected)
  nmap <silent> <leader>lh :call CocAction('doHover')<CR>
  nmap <silent> <leader>ls :<C-u>CocList outline<CR>
  nmap <silent> <leader>lm :<C-u>CocList commands<CR>

  " bases
  nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
  " bases of up to 3 levels
  nn <silent> xb :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
  " derived
  nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
  " derived of up to 3 levels
  nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

  " caller
  nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
  " callee
  nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

  " $ccls/member
  " member variables / variables in a namespace
  nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
  " member functions / functions in a namespace
  nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
  " nested classes / types in a namespace
  nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

  nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
  nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType cpp,c call SetLSPShortcuts()
augroup END
