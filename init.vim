filetype plugin on

packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Code plugins
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('dart-lang/dart-vim-plugin')
call minpac#add('jackguo380/vim-lsp-cxx-highlight')

call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('ntpeters/vim-better-whitespace')
call minpac#add('junegunn/vim-easy-align')

" Navigational plugins
call minpac#add('mhinz/vim-startify')
call minpac#add('vimlab/split-term.vim')

" Visual plugins
call minpac#add('itchyny/lightline.vim')

call minpac#add('ryanoasis/vim-devicons')

call minpac#add('lifepillar/vim-solarized8')
call minpac#add('NLKNguyen/papercolor-theme')
call minpac#add('mhartington/oceanic-next')
call minpac#add('morhetz/gruvbox')
call minpac#add('fenetikm/falcon')
call minpac#add('arcticicestudio/nord-vim')

" SVN Plugins
call minpac#add('tpope/vim-fugitive')
call minpac#add('mhinz/vim-signify')

command! PackUpdate call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call minpac#clean()
command! PackStatus call minpac#status()

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
let g:gruvbox_italic=1
colorscheme gruvbox

let g:falcon_lightline = 1
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
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

let g:coc_global_extensions = [ "coc-html", "coc-css", "coc-cmake", "coc-clangd", "coc-explorer", "coc-flutter", "coc-git", "coc-json", "coc-lists", "coc-rust-analyzer", ]

set incsearch
set hlsearch

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

set cmdheight=2

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

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Mappings using CocList:
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
" List all files below cwd
nnoremap <silent> <space>t  :<C-u>CocList files<cr>
" List all open buffers
nnoremap <silent> <space>b  :<C-u>CocList buffers<cr>
" Search lines in file
nnoremap <silent> <space>l  :<C-u>CocList lines<cr>
" Search for word in files in the current directory
nnoremap <silent> <space>g  :<C-u>CocList grep<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Opens directory explorer
nnoremap <silent> <space>x :<C-u>CocCommand explorer<cr>

nn xx x
