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
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
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

set pyxversion=3

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

let g:falcon_lightline = 1
let g:lightline = {
	\ 'colorscheme': 'falcon',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

set incsearch
set hlsearch

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nmap <leader>t :Files<CR>
nmap <leader>b :Buffers<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nmap <Leader>as <Plug>(AerojumpSpace)
nmap <Leader>ab <Plug>(AerojumpBolt)
nmap <Leader>aa <Plug>(AerojumpFromCursorBolt)
nmap <Leader>ad <Plug>(AerojumpDefault)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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

" Coc.vim configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Required for operations modifying multiple buffers like rename.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction


nmap <silent> <leader>rn <Plug>(coc-rename)

xmap <silent> <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

xmap <silent> <leader>f <Plug>(coc-format-selected)
nmap <silent> <leader>f <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nn xx x
