call plug#begin(expand('~/.config/nvim/plug/'))

" Language support
Plug 'rust-lang/rust.vim'
Plug 'nvie/vim-flake8'
Plug 'hynek/vim-python-pep8-indent'
Plug 'lifepillar/pgsql.vim'
Plug 'cespare/vim-toml'
Plug 'ElmCast/elm-vim'

    " Template and Markdown
    Plug 'Shutnik/jshint2.vim'
    Plug 'chase/vim-ansible-yaml'
    Plug 'lervag/vim-latex'
    Plug 'plasticboy/vim-markdown', {'depends': 'godlygeek/tabular'}

    " Frontend
    Plug 'pangloss/vim-javascript'
    Plug 'othree/html5.vim'
    Plug 'hail2u/vim-css3-syntax'


" Looks
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'luochen1990/rainbow'
Plug 'Valloric/MatchTagAlways'

" Tools
Plug 'rking/ag.vim'

" Functionality
Plug 'michaeljsmith/vim-indent-object'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'bronson/vim-visual-star-search'
Plug 'terryma/vim-multiple-cursors'
Plug 'metakirby5/codi.vim'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}

" Editing
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

" Navigation
Plug 'vim-scripts/a.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'easymotion/vim-easymotion'
Plug 'nixprime/cpsm', { 'do': 'PY3=ON ./install.sh' }
Plug 'scrooloose/nerdtree'

" Syntax checking support
Plug 'w0rp/ale'

" Formatting
Plug 'Chiel92/vim-autoformat'
Plug 'vim-scripts/SQLUtilities'
Plug 'vim-scripts/Align'

" Auto completion
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --clang-completer --system-libclang --omnisharp-completer --system-boost' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

call plug#end()

" Required:
filetype plugin indent on

" Setting Runtimepath for jshint
set runtimepath+=~/.vim/bundle/jshint2.vim/

" Basics settings
set showmatch           " show matching brackets (),{},[]
set showmode            " show mode at bottom of screen
set shell=zsh           " set zsh as standart vim shell
set history=100         " 100 lines of command line history
set encoding=utf-8
set fileencoding=utf-8
set termguicolors
set t_Co=256            " set 256 color
colorscheme darkspectrum " define syntax color scheme
set spell spelllang=en_us,de


set backspace=2         " full backspacing capabilities
set shortmess+=I        " disable the welcome screen
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
set wrap                " word wrap
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

" Auto completion stuff
filetype plugin on
set ofu=syntaxcomplete#Complete

" Enable dictionary completion
set complete+=k

set completeopt=menuone,menu,longest,preview

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" CtrlP configuration
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 20000
let g:ctrlp_dotfiles = 1
let g:ctrlp_custom_ignore = 'target\|venv\|vendor\|node_modules\|DS_Store\|\.git\|elm-stuff'
let g:ctrlp_working_path_mode='.'
let g:ctrlp_switch_buffer = 0
    " Use CPSM for file finding
    let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}


" Python
let g:ycm_python_binary_path = './venv/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

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

" YCM config
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_goto_buffer_command = 'vertical-split'

" Postgres syntax
let g:sql_type_default = 'pgsql'

" Vim git gutter
let g:gitgutter_max_signs = 20000

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Restore position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" Python specific configs
    autocmd FileType python let python_highlight_all = 1
    autocmd FileType python let python_highlight_space_errors = 1
    autocmd FileType python let python_slow_sync = 1

" Map keys
    " Map ; to :
    map ; :

        " Disable F1 help
    :nmap <F1> :echo<CR>
    :imap <F1> <C-o>:echo<CR>

    " Ctrlp-funky
    :nnoremap fu :CtrlPFunky<Cr>

    :map <C-]> :YcmCompleter GoTo<CR>
    :map <F8> :Tagbar <CR>

" Open help vertically by typing :Help .
command -nargs=* -complete=help Help vertical belowright help <args>

" Split shortcuts
command V vsplit | A
command S vsplit | A
command H split | A
command T tabnew
command U set tabstop=4 | set shiftwidth=4 | set softtabstop=4
command I set tabstop=2 | set shiftwidth=2 | set softtabstop=2

" Vim sudo hack
cmap w!! w !sudo tee > /dev/null %

" UltiSnips completion shortcuts
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" Set Colors
hi CtrlPLinePre ctermbg=red ctermfg=red

