"Basics
set nocompatible        " use Vim defaults
set encoding=utf-8
set fileencoding=utf-8
set t_Co=256            " set 256 color
if has("gui_running")
    colorscheme colorful
else
    colorscheme darkspectrum " define syntax color scheme
endif
set shortmess+=I        " disable the welcome screen
set clipboard=unnamedplus  " yank and copy to X clipboard
set backspace=2         " full backspacing capabilities
set history=100         " 100 lines of command line history
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

autocmd Filetype tex,latex :set dictionary=~/.vim/dict/latex.dict

filetype plugin on

" Mapping keys
"Map ; to :
map ; :

" Disable F1 help
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

" Tlist
nnoremap <silent> <F7> :TlistUpdate<CR>
inoremap <silent> <F7> <esc>:TlistUpdate<CR>a
nnoremap <silent> <F8> :TlistToggle<CR>
inoremap <silent> <F8> <esc>:TlistToggle<CR>a
" Pythonscript running
map <F9> :w! <CR> :!python %<CR>
" Spell check
map <F12> :w<CR>:!aspell -c %<CR><CR>:e<CR><CR> 

" set bash as standart vim shell
set shell=bash

" wrap like other editors
set wrap                " word wrap
"set textwidth=79        " 
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs

" backup settings
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


"ycm config
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1

" Completion Shortcuts
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" taglist
let Tlist_Use_Right_Window = 1
let Tlist_Compart_Format = 1
let Tlist_Show_Menu = 1
let Tlist_Exit_OnlyWindow = 1

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
"autocmd FileType python :set textwidth=79
"autocmd FileType python set expandtab shiftwidth=4 softtabstop=4 

" additional syntax
au BufRead,BufNewFile *.qml setfiletype qml

"Manual graphics
hi Search cterm=NONE ctermfg=0 ctermbg=7

