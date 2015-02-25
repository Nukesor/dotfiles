" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
let g:neobundle#types#git#enable_submodule = 1

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'linux' : 'make',
    \   },
    \ }

" Language support
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'dart-lang/dart-vim-plugin'
NeoBundle 'groenewege/vim-less'
NeoBundle 'plasticboy/vim-markdown', {'depends': 'godlygeek/tabular'}
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'lervag/vim-latex'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'mitsuhiko/vim-jinja'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'Shutnik/jshint2.vim'

" Looks
NeoBundle 'bling/vim-airline'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'luochen1990/rainbow'

" Functionality
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'dyng/ctrlsf.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'xuhdev/vim-latex-live-preview'
NeoBundle 'rhysd/vim-clang-format'

NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build': {
    \   'linux': './install.sh --clang-completer --system-libclang --system-boost',
    \   'directory': 'YouCompleteMe'
    \   },
    \ }

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"Setting Runtimepath for jshint
set runtimepath+=~/.vim/bundle/jshint2.vim/

" Basics settings
set showmatch           " show matching brackets (),{},[]
set showmode            " show mode at bottom of screen
set shell=zsh           " set zsh as standart vim shell
set history=100         " 100 lines of command line history
set encoding=utf-8
set fileencoding=utf-8
set t_Co=256            " set 256 color
if has("gui_running")
    colorscheme colorful
else
    colorscheme darkspectrum " define syntax color scheme
endif

set backspace=2         " full backspacing capabilities
set shortmess+=I        " disable the welcome screen
set clipboard=unnamedplus  " yank and copy to X clipboard
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down

"Navigation
set mouse=a             " make sure mouse is used in all cases.

"Show matching pairs
set showmatch           " show matching brackets (),{},[]
set matchpairs+=<:>     " match < and > as well
set mat=0              " show matching brackets for 0.5 seconds

"Cursor settings
set cursorline          " highlight cursor line
set cursorcolumn        " highlight cursor column (breaks completion preview)

"Sugar 
set ruler               " ruler display in status line
set number              " show line numbers
set showmode            " show mode at bottom of screen
set cmdheight=1         " set the command height
set showcmd             " show incomplete command at bottom of screen

"Opens help vertically by typing :Help . 
command -nargs=* -complete=help Help vertical belowright help <args> 
command -nargs=* NERD NERDTree <args>
command V vsplit | A
command T tabnew
command U set tabstop=4 | set shiftwidth=4 | set softtabstop=4
command I set tabstop=2 | set shiftwidth=2 | set softtabstop=2


autocmd Filetype tex,latex :set dictionary=~/.vim/dict/latex.dict

filetype plugin on

 
" wrap like other editors
set wrap                " word wrap
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs

" backup settings
set noswapfile          " don't create a swap file
set backup              " keep a backup file
set backupdir=/tmp      " backup dir
set directory=/tmp      " swap file directory

" tabs and indenting
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set listchars=tab:→,trail:¸ " show trail spaces and tabstchars

"command mode
set wildmenu 
set wildmode=list:longest,full

" searching
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search

" syntax highlighting
syntax on               " enable syntax highlighting

" auto completion stuff
filetype plugin on
set ofu=syntaxcomplete#Complete

set complete+=k         " enable dictionary completion

set completeopt=menuone,menu,longest,preview

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Latex config
let g:latex_fold_enabled = 0
let g:livepreview_previewer = 'okular'

" YCM config
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1

" UltiSnips completion shortcuts
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Disable Folding
:let Tex_FoldedSections=""
:let Tex_FoldedEnvironments=""
:let Tex_FoldedMisc=""
set nofoldenable

" restore position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" file types
autocmd FileType python let python_highlight_all = 1
autocmd FileType python let python_highlight_space_errors = 1
autocmd FileType python let python_slow_sync = 1

" Mapping keys
    "Map ; to :
map ; :

    " Disable F1 help
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

    " Setting F2 to :JSHint
nmap <silent> <F2> :JSHint <CR>
