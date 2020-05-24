"----------------------------------------------  Plugin initialization ----------------------------------------------

call plug#begin(expand('~/.config/nvim/plug/'))
"----- Programming language support ------
" NCM2
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'roxma/nvim-yarp' | Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-racer'
Plug 'ncm2/ncm2-markdown-subscope'

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
\ }


"----- Other language support ------
" Markup/Data structure support
"Plug 'sheerun/vim-json'
"Plug 'cespare/vim-toml'
"Plug 'stephpy/vim-yaml'
"Plug 'mustache/vim-mustache-handlebars'

" Tools
Plug 'nginx/nginx', {'rtp': 'contrib/vim'}
Plug 'ekalinin/Dockerfile.vim'
"Plug 'pearofducks/ansible-vim'
"Plug 'Firef0x/PKGBUILD.vim'


"----- Looks ------
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'Valloric/MatchTagAlways'
Plug 'ap/vim-css-color'
Plug 'ntpeters/vim-better-whitespace'

"----- Functionality ------
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'junegunn/fzf'
Plug 'sjl/gundo.vim'

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
Plug 'bronson/vim-visual-star-search'
Plug 'jremmen/vim-ripgrep'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'nixprime/cpsm', { 'do': 'PY3=ON ./install.sh' }
Plug 'dyng/ctrlsf.vim'
Plug 'vim-scripts/taglist.vim'

" Formatting
Plug 'psf/black', { 'branch': 'stable' }
"Plug 'Chiel92/vim-autoformat'

call plug#end()

" Required:
filetype plugin indent on

"----------------------------------------------  Plugin Config ----------------------------------------------
"----- NCM2 ------
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd TextChangedI * call ncm2#auto_trigger()
" Enable logging for vim. Good for ncm2 debugging
"let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
"let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

" :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" keys
inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select an item in the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"----- LanguageClient ------
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'python': ['/usr/bin/pyls'],
    \ 'javascript': ['/usr/bin/javascript-typescript-langserver'],
    \ 'sh': ['bash-language-server', 'start'],
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
  nnoremap <F7> :call LanguageClient_contextMenu()<CR>
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType rust,python,dart,sh,c,cpp,cude,obj,java call SetLSPShortcuts()
augroup END

"----- Easymotion ------
map <Leader> <Plug>(easymotion-prefix)

"----- CtrlP ------
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 20000
let g:ctrlp_working_path_mode='.'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = 'v'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_user_command = 'rg %s --files -i --color=never --glob ''!.git'' --glob ''!.DS_Store'' --glob ''!node_modules'' --glob ''!vendor'' --glob ''!target'' --no-messages --hidden -g ""'
" Some special CTRLP styling
"hi CtrlPLinePre ctermbg=red ctermfg=red

" CPSM matching
" Use CPSM for file finding
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" Ctrlp-funky
:nnoremap fu :CtrlPFunky<Cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

"----- NERDTree ------
let NERDTreeIgnore=['__pycache__', '\~$']
let g:NERDTreeBookmarksFile = '$HOME/.cache/NERDTreeBookmarks'
command -nargs=* NERD NERDTree <args>

"----- AirLine ------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = ''
let g:airline_section_gutter = ''
let g:airline_section_x = ''
let g:airline_section_z = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

"----- GitGutter ------
let g:gitgutter_max_signs = 20000

"----------------------------------------------  Vim internal options ----------------------------------------------
"----- Basics settings ------
set shell=zsh                   " set zsh as standart vim shell
set history=100                 " 100 lines of command line history
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start  " full backspacing capabilities
set clipboard=unnamedplus       " yank and copy to X clipboard
set shortmess+=c                " disable the welcome screen

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

:let mapleader = ","    " Set the map leader for custom commands


"----- Functionality ------
" Spell checking
set spelllang=en_us,de
"set spell

" Vim sudo hack
cmap w!! w !sudo tee > /dev/null %

" Misc
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable auto commenting
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif " Automatically open and close the popup menu / preview window

"----- Navigation ------
set mouse=a             " make sure mouse is used in all cases.
set splitbelow          " hsplit opens below current window
set splitright          " ssplit opens right of current window

"----- Looks ------
set termguicolors
set t_Co=256            " set 256 color
colorscheme earendel    " define syntax color scheme
syntax on               " enable syntax highlighting
set showmode            " show mode at bottom of screen
set showmatch           " show matching brackets (),{},[]
set matchpairs+=<:>     " match < and > as well
"set mat=0              " show matching brackets for 0.5 seconds
"set background=dark

" Cursor highlighting
set cursorline          " highlight cursor line
set cursorcolumn        " highlight cursor column (breaks completion preview)

" Sugar
set ruler               " ruler display in status line
set number              " show line numbers
set showmode            " show mode at bottom of screen
set cmdheight=1         " set the command height
set showcmd             " show incomplete command at bottom of screen

" Wrapping
set nowrap              " Don't auto-wrap lines. This hides long lines and is bad practice
"set display=lastline    " don't display @ with long paragraphs

" Command mode
"set wildmenu
"set wildmode=list:longest,full

" Search stuff
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search

" Auto completion stuff
"set ofu=syntaxcomplete#Complete

" Enable dictionary completion
"set complete+=k


"----- Languages ------
" Python specific configs
autocmd BufWritePre *.py silent! execute ':Black'
autocmd FileType python let python_highlight_all = 1
autocmd FileType python let python_highlight_space_errors = 1
autocmd FileType python let python_slow_sync = 1

"----------------------------------------------  Key mappings ----------------------------------------------
" Map ; to :
map ; :

" Save with CTRL + S
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Disable F1 help
:nnoremap <F1> :echo<CR>
:inoremap <F1> <C-o>:echo<CR>

" Enable spell
:nnoremap <F8> :set spell spellang=en_us <CR>

" Split/tab shortcuts
command V vsplit | A
command H split | A
command T tabnew
