filetype plugin on

if !exists('g:vscode')
    packadd minpac

    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})

    " Code plugins
    call minpac#add('neovim/nvim-lspconfig')
    call minpac#add('nvim-lua/completion-nvim')
    call minpac#add('nvim-lua/lsp-status.nvim')
    call minpac#add('nvim-lua/diagnostic-nvim')

    call minpac#add('elixir-editors/vim-elixir')

    call minpac#add('jiangmiao/auto-pairs')
    call minpac#add('junegunn/vim-easy-align')
    call minpac#add('ntpeters/vim-better-whitespace')
    call minpac#add('scrooloose/nerdcommenter')
    call minpac#add('tpope/vim-surround')
    call minpac#add('tpope/vim-unimpaired')
    call minpac#add('AndrewRadev/splitjoin.vim')

    " Writing plugins
    call minpac#add('vimwiki/vimwiki')
    call minpac#add('junegunn/limelight.vim')
    call minpac#add('junegunn/goyo.vim')

    " Navigational plugins
    call minpac#add('mhinz/vim-startify')
    call minpac#add('scrooloose/nerdtree')
    call minpac#add('ryanoasis/vim-devicons')
    call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
    call minpac#add('junegunn/fzf.vim')
    call minpac#add('kassio/neoterm')
    call minpac#add('bagrat/vim-buffet')

    " Visual plugins
    call minpac#add('itchyny/lightline.vim')

    call minpac#add('lifepillar/vim-solarized8')
    call minpac#add('NLKNguyen/papercolor-theme')
    call minpac#add('mhartington/oceanic-next')
    call minpac#add('morhetz/gruvbox')
    call minpac#add('fenetikm/falcon')
    call minpac#add('arcticicestudio/nord-vim')
    call minpac#add('nvim-treesitter/nvim-treesitter')

    " SVN Plugins
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('mhinz/vim-signify')

    command! PackUpdate call minpac#update('', {'do': 'call minpac#status()'})
    command! PackClean  call minpac#clean()
    command! PackStatus call minpac#status()

    packadd nvim-lspconfig
    packadd completion-nvim
    packadd lsp-status.nvim
    packadd diagnostic-nvim
    packadd nvim-treesitter

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

" Statusline
function! LspStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        return luaeval("require('lsp-status').status()")
    endif

    return ''
endfunction

function! LspReload()
    lua vim.lsp.stop_client(vim.lsp.get_active_clients())
    edit
endfunction

    let g:completion_confirm_key = "\<C-y>"
    let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

    let g:NERDTreeShowHidden = 1
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeIgnore = []
    let g:NERDTreeStatusline = ''
    " Automaticaly close nvim if NERDTree is only thing left open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}
    " requires silversearcher-ag
    " used to ignore gitignore files
    let g:fzf_history_dir = '~/.local/share/fzf-history'
    let g:fzf_buffers_jump = 1
    let g:fzf_tags_command = 'ctags -R'

    let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
    let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

    " open new split panes to right and below
    set splitright
    set splitbelow

    let g:gruvbox_italic=1
    let g:gruvbox_contrast_dark = 'hard'
    let g:gruvbox_invert_selection='0'

    let g:lightline = {
        \ 'colorscheme': 'falcon',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'lspstatus', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'lspstatus': 'LspStatus'
        \ },
        \ }

    if exists('g:neovide')
        let g:neovide_cursor_animation_length=0
        let g:neovide_cursor_antialiasing=v:true
        let g:neovide_refresh_rate=140
    endif

    set guifont=Iosevka:h16

    set incsearch
    set hlsearch

    set cmdheight=2

    " Required for operations modifying multiple buffers like rename.
    set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Set completeopt to have a better completion experience
    set completeopt=menuone,noinsert,noselect
    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    set signcolumn=yes

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

local nvim_lsp = require'nvim_lsp'
local diagnostic = require'diagnostic'
local completion = require'completion'
local lsp_status = require'lsp-status'

lsp_status.register_progress()

local on_attach_vim = function(client, bufnr)
  completion.on_attach()
  lsp_status.on_attach(client)
  diagnostic.on_attach()
end

nvim_lsp.clangd.setup{
  callbacks = lsp_status.extensions.clangd.setup();
  init_options = {
    clangdFileStatus = true
  };
  on_attach = on_attach_vim;
  capabilities = lsp_status.capabilities
}

nvim_lsp.cmake.setup{
  on_attach = on_attach_vim;
  capabilities = lsp_status.capabilities
}

nvim_lsp.elixirls.setup{
  cmd = { "/home/tracy/.elixir-ls/release/language_server.sh" };
  root_dir = nvim_lsp.util.root_pattern("mix.exs");
  on_attach = on_attach_vim;
  capabilities = lsp_status.capabilities
}

nvim_lsp.rust_analyzer.setup{
  on_attach = on_attach_vim;
  capabilities = lsp_status.capabilities
}

nvim_lsp.vimls.setup{
  on_attach = on_attach_vim;
  capabilities = lsp_status.capabilities
}
EOF

    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> <cmd>lua vim.lsp.buf.completion()<CR>

    nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> 1gd   <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <cmd>PrevDiagnostic<CR>
    nmap <silent> ]g <cmd>NextDiagnostic<CR>

    nmap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

    xmap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
    nmap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>

    xmap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
    nmap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " Find symbol of current document.
    nnoremap <silent> <space>o  <cmd>lua vim.lsp.buf.document_symbol()<CR>
    " Search workspace symbols.
    nnoremap <silent> <space>s  <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
    " List all files below cwd
    nnoremap <silent> <space>t  <cmd>Files<cr>
    " List all open buffers
    nnoremap <silent> <space>b  <cmd>Buffers<cr>
    " Search lines in file
    nnoremap <silent> <space>l  <cmd>Lines<cr>
    " Search for word in files in the current directory
    nnoremap <silent> <space>g  <cmd>Rg<cr>

    " Opens directory explorer
    nnoremap <silent> <space>x <cmd>NERDTreeToggle<cr>

    nnoremap <silent> <leader>ftn <cmd>Tnew<cr>
    nnoremap <silent> <leader>ftt <cmd>Ttoggle<cr>

    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
else
endif
