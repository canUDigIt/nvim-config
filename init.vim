filetype plugin on

call plug#begin('~/.vim/plugged')

" Navigational plugins
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'

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
Plug 'bbchung/Clamp'

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

nmap <leader>t :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>

let g:deoplete#enable_at_startup = 1

let g:clamp_libclang_file = '/usr/lib/libclang.so'

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
endfunction()

augroup LSP
  autocmd!
  autocmd FileType cpp,c call SetLSPShortcuts()
augroup END
