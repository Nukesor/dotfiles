"----------------------------------------------  Plugin Config ----------------------------------------------
let mapleader = ","    " Set the map leader for custom commands

"----- Skim ------
nnoremap <C-p> :Files<Cr>
nnoremap <leader>r :Rg<Cr>

" Use proximity-sort to make sure that files are properly sorted
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
map <Leader>f <Plug>(easymotion-prefix)

"----- NERDTree ------
let g:NERDTreeMinimalMenu=1
let NERDTreeIgnore=['__pycache__']
let g:NERDTreeBookmarksFile = '$HOME/.cache/NERDTreeBookmarks'
" Jumps to file in current buffer
nnoremap <silent> <leader>no :NERDTreeFocus<CR>
nnoremap <silent> <leader>ns :NERDTreeFind<CR>

"----- AirLine ------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
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

"----- Navigation ------
set mouse=a             " make sure mouse is used in all cases.
set splitbelow          " hsplit opens below current window
set splitright          " ssplit opens right of current window

"----- Colorscheme -----
syntax on               " enable syntax highlighting
set background=dark
set termguicolors
set t_Co=256            " set 256 color

" Gruvbox: values are soft,medium,hard
let g:gruvbox_contrast_dark="medium"
colorscheme gruvbox     " define syntax color scheme

" Codedark:
"let g:codedark_modern=1
"let g:airline_theme = 'codedark'
"colorscheme codedark

" Ayu: values are light,mirage,dark
"let ayucolor="dark"
"colorscheme ayu

"----- Looks ------
set showmode            " show mode at bottom of screen
set showmatch           " show matching brackets (),{},[]
set matchpairs+=<:>     " match < and > as well
"set mat=0              " show matching brackets for 0.5 seconds
set signcolumn=number   " show the line number

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
autocmd FileType python let python_highlight_all = 1
autocmd FileType python let python_highlight_space_errors = 1
autocmd FileType python let python_slow_sync = 1

"----------------------------------------------  Key mappings ----------------------------------------------
" Map ; to :
map ; :

" Save with CTRL + S. `:update` only writes if there're changes in the buffer.
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
