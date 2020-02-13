call plug#begin(expand('~/.config/nvim/plug/'))

" Language support
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'pearofducks/ansible-vim'
Plug 'JulesWang/css.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-git'
Plug 'fatih/vim-go'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'sheerun/vim-json'
Plug 'nginx/nginx', {'rtp': 'contrib/vim'}
Plug 'zah/nim.vim'
Plug 'vim-perl/vim-perl'
Plug 'StanAngeloff/php.vim'
Plug 'uarun/vim-protobuf'
Plug 'mitsuhiko/vim-python-combined'
Plug 'kurayama/systemd-vim-syntax'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'Firef0x/PKGBUILD.vim'
Plug 'Quramy/tsuquyomi'
Plug 'pangloss/vim-javascript'

" Looks
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ap/vim-css-color'
Plug 'Valloric/MatchTagAlways'
"Plug 'luochen1990/rainbow'
"let g:rainbow_active = 1

" Functionality
Plug 'justinmk/vim-syntax-extra'
Plug 'jremmen/vim-ripgrep'
Plug 'michaeljsmith/vim-indent-object'
Plug 'editorconfig/editorconfig-vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'vim-scripts/SQLUtilities'
Plug 'mhinz/neovim-remote'
Plug 'vim-scripts/a.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/taglist.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Lokaltog/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'nixprime/cpsm', { 'do': './install.sh' }
Plug 'dyng/ctrlsf.vim'
Plug 'sjl/gundo.vim'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'Chiel92/vim-autoformat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'metakirby5/codi.vim'
Plug 'bronson/vim-visual-star-search'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'junegunn/fzf'

" NCM2
Plug 'roxma/nvim-yarp' | Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-racer'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
\ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'ctrlpvim/ctrlp.vim'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'

" Editing
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

" Navigation
Plug 'vim-scripts/a.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'tacahiroy/ctrlp-funky'
Plug 'nixprime/cpsm', { 'do': 'PY3=ON ./install.sh' }

Plug 'nukesor/ctrlp-rs.vim'
call plug#end()

" Required:
filetype plugin indent on

" Basics settings
set showmatch           " show matching brackets (),{},[]
set showmode            " show mode at bottom of screen
set shell=zsh           " set zsh as standart vim shell
set history=100         " 100 lines of command line history
set encoding=utf-8
set fileencoding=utf-8
set termguicolors
set t_Co=256            " set 256 color
set background=dark
"colorscheme inori
colorscheme earendel    " define syntax color scheme
set spelllang=en_us,de
"set spell


set backspace=2         " full backspacing capabilities
set shortmess+=c        " disable the welcome screen
set clipboard=unnamedplus  " yank and copy to X clipboard
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down

" Navigation
set mouse=a             " make sure mouse is used in all cases.

" Show matching pairs
set showmatch           " show matching brackets (),{},[]
set matchpairs+=<:>     " match < and > as well
set mat=0              " show matching brackets for 0.5 seconds

" Cursor settings
set cursorline          " highlight cursor line
set cursorcolumn        " highlight cursor column (breaks completion preview)

" Stuff
set splitbelow
set splitright

" Sugar
set ruler               " ruler display in status line
set number              " show line numbers
set showmode            " show mode at bottom of screen
set cmdheight=1         " set the command height
set showcmd             " show incomplete command at bottom of screen

filetype plugin on

" Wrap like other editors
set nowrap                " word wrap
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs

" Backup settings
set noswapfile          " don't create a swap file
set backup              " keep a backup file
set backupdir=/tmp      " backup dir
set directory=/tmp      " swap file directory

" Tabs and indenting
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set listchars=tab:→,trail:¸ " show trail spaces and tabstchars
autocmd FileType json setlocal shiftwidth=2 tabstop=2

" Command mode
set wildmenu
set wildmode=list:longest,full

" Search stuff
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search

" Syntax highlighting
syntax on               " enable syntax highlighting

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Auto completion stuff
set ofu=syntaxcomplete#Complete

" Enable dictionary completion
set complete+=k


" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" ncm2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki


" CtrlP
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 20000
let g:ctrlp_working_path_mode='.'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = 'v'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_user_command = 'rg %s --files -i --color=never --glob ''!.git'' --glob ''!.DS_Store'' --glob ''!node_modules'' --glob ''!vendor'' --glob ''!target'' --no-messages --hidden -g ""'
" CPSM matching
" Use CPSM for file finding
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" Ctrlp-funky
:nnoremap fu :CtrlPFunky<Cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

" Nerd tree ignores
let NERDTreeIgnore=['__pycache__', '\~$']
command -nargs=* NERD NERDTree <args>

" Airline configuration
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = ''
let g:airline_section_gutter = ''
let g:airline_section_x = ''
let g:airline_section_z = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''


" LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'python': ['/usr/bin/pyls'],
    \ 'javascript': ['/usr/bin/javascript-typescript-langserver'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'cuda': ['clangd'],
    \ 'obcj': ['clangd'],
    \ 'java': ['jdtls', '-data', getcwd()],
    \ 'php': ['jdtls', '-data', getcwd()],
    \ }

let $RUST_BACKTRACE = 1
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loggingFile = expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
let g:LanguageClient_diagnosticsList = 'Disabled'

function SetLSPShortcuts()
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType rust,python,dart,sh,c,cpp,cude,obj,java call SetLSPShortcuts()
augroup END

" Vim git gutter
let g:gitgutter_max_signs = 20000

" Python specific configs
autocmd FileType python let python_highlight_all = 1
autocmd FileType python let python_highlight_space_errors = 1
autocmd FileType python let python_slow_sync = 1

" Map keys
" Map ; to :
map ; :

" Save with CTRL + S
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Disable F1 help
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

" Enable spell
:nmap <F8> :set spell spellang=en_us <CR>

inoremap <c-c> <ESC>

" ncm2 keys
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Split shortcuts
command V vsplit | A
command H split | A
command T tabnew
command U set tabstop=4 | set shiftwidth=4 | set softtabstop=4
command I set tabstop=2 | set shiftwidth=2 | set softtabstop=2

" UltiSnips completion shortcuts
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
autocmd FileType help unmap <C-]>
" Vim sudo hack
cmap w!! w !sudo tee > /dev/null %

" Set Colors
hi CtrlPLinePre ctermbg=red ctermfg=red
