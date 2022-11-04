"----------------------------------------------  Plugin initialization ----------------------------------------------

call plug#begin(expand('~/.local/share/nvim/plug/'))
"----- Programming language support ------
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Base Coc plugin
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-lua', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-flutter', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"Plug 'kristijanhusak/vim-dadbod-completion', {'do': 'yarn install --frozen-lockfile'} " Database (SQL) completion

"----- Programming language Linting -----
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}

"----- Other language support ------
" Markup/Data format/Templating languages
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'kkiyama117/coc-toml', {'do': 'yarn install --frozen-lockfile'}
Plug 'stephpy/vim-yaml'
Plug 'Glench/Vim-Jinja2-Syntax'

" Configuration language support
Plug 'nginx/nginx', {'rtp': 'contrib/vim'}
Plug 'hashivim/vim-hashicorp-tools'
Plug 'pearofducks/ansible-vim'
Plug 'm-pilia/vim-pkgbuild'
Plug 'NoahTheDuke/vim-just' " Just file support

"----- Looks ------
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'Valloric/MatchTagAlways' " Highlight matching brackets
Plug 'ap/vim-css-color'

"----- Functionality ------
Plug 'gpanders/editorconfig.nvim' " Automatically parse and apply editorconfig
Plug 'terryma/vim-multiple-cursors' " Multi-cursor support
Plug 'tomtom/tcomment_vim' " Toggle comments in front of lines via 'gc'
Plug 'tpope/vim-surround' " Easy bracket/quote manipulation
Plug 'ntpeters/vim-better-whitespace' " Display whitespaces at end of lines and provide :StripWhitespace
Plug 'dyng/ctrlsf.vim' " Multi-file search + replace

" Snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Git support
Plug 'tpope/vim-fugitive' " Git command wrapper + integration
Plug 'jreybert/vimagit' " Vim integrated staging + conflict resolution
Plug 'airblade/vim-gitgutter' " Vim change indicator beside lines

" Navigation
Plug 'easymotion/vim-easymotion' " Vimium-like motion helper for vim
Plug 'scrooloose/nerdtree' " File tree
"Plug 'nvim-tree/nvim-tree.lua' " File tree
"Plug 'vim-scripts/taglist.vim' " Code-overview in sidebuffer. Classes, functions, structs, etc.
Plug 'junegunn/fzf.vim' " Fast and interactive search stuff
Plug 'junegunn/fzf' " Requirement for fzf.vim

call plug#end()

" Required:
filetype plugin indent on

"----------------------------------------------  Plugin Config ----------------------------------------------
let mapleader = ","    " Set the map leader for custom commands

"----- Coc ------
" Some servers have issues with backup files, see #649.
set nowritebackup

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nnoremap <silent> <leader>ghd :call CocAction('jumpDefinition', 'split')<CR>
nnoremap <silent> <leader>gvd :call CocAction('jumpDefinition', 'vsplit')<CR>

nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Buffer code action menu
nmap <leader>af <Plug>(coc-codeaction)
" Selected code action menu
nmap <leader>al <Plug>(coc-codeaction-line)
" Selected code action menu
xmap <leader>as <Plug>(coc-codeaction-selected)
" Word action menu
nmap <leader>aw viw<Plug>(coc-codeaction-selected)
vmap <leader>aw <Plug>(coc-codeaction-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
" format current buffer.
nmap <leader>f <Plug>(coc-action-format)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" organize imports of the current buffer.
nmap <leader>o <Plug>(coc-action-organizeImport)

" List workspace symbols.
nmap <leader>s <Plug>(coc-list-symbols)

" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

"----- fzf ------
nnoremap <C-p> :Files<Cr>
nnoremap <leader>r :Rg<Cr>

" use proximity-sort to make sure that files are sorted according
function! s:list_cmd()
    let base = fnamemodify(expand('%'), ':h:.:S')
    return base == '.' ? 'fd -t f' : printf('fd -t f | proximity-sort %s', expand('%'))
endfunction

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(
    \   <q-args>,
    \   fzf#vim#with_preview({
    \      'source': s:list_cmd(),
    \      'options': '--tiebreak=index --bind=ctrl-n:preview-down,ctrl-p:preview-up'
    \   }),
    \   <bang>0
    \ )

"----- ctrlsf ------
nmap <C-k> <Plug>CtrlSFPrompt

"----- Easymotion ------
"map <Leader> <Plug>(easymotion-prefix)

"----- NERDTree ------
let g:NERDTreeMinimalMenu=1
let NERDTreeIgnore=['__pycache__', '\~$']
let g:NERDTreeBookmarksFile = '$HOME/.cache/NERDTreeBookmarks'
command -nargs=* NERD NERDTree <args>
" Jumps to file in current buffer
nnoremap <C-f> :NERDTreeFind<CR>

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
set updatetime=300              " Milliseconds to swap file write

" Backup settings
set noswapfile          " don't create a swap file
set nobackup              " keep a backup file
set directory=/tmp      " swap file directory

" Tabs and indenting
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set listchars=tab:→,trail:¸ " show trail spaces and tabstchars

" Display title in window bar
set title
autocmd BufEnter * let &titlestring = "neovim: " . expand("%:t")

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
autocmd BufWritePre * silent! execute ':Format'

" Python specific configs
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
nmap <leader>v :vsplit<CR>
nmap <leader>h :split<CR>
nmap <leader>t :tabnew<CR>
