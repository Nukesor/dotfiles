"----------------------------------------------  Native key mappings ----------------------------------------------

" Save with CTRL + S. `:update` only writes if there're changes in the buffer.
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Close buffer
:nnoremap <leader>q :q<CR>

" Navigate
:nnoremap <leader>h <C-w>h
:nnoremap <leader>j <C-w>j
:nnoremap <leader>k <C-w>k
:nnoremap <leader>l <C-w>l


:nnoremap <C-j> :resize -5<CR>
:nnoremap <C-k> :resize +5<CR>
:nnoremap <C-h> :vertical resize +10<CR>
:nnoremap <C-l> :vertical resize -10<CR>

" Split/tab shortcuts
set splitbelow          " hsplit opens below current window
set splitright          " ssplit opens right of current window
nmap <leader>v :vsplit<CR>
nmap <leader>i :split<CR>
nmap <leader>t :tabnew<CR>:Neotree source=filesystem<CR>

" Disable F1 help
:nnoremap <F1> :echo<CR>
:inoremap <F1> <C-o>:echo<CR>

" Enable spell
:nnoremap <F8> :set spell spellang=en_us <CR>

"----------------------------------------------  Plugin Config ----------------------------------------------
"----- Skim ------
 nnoremap <C-p> :Files<Cr>
"nnoremap <leader>r :Rg<Cr>

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

"----- Hop ------
map <Leader>fh :HopWordCurrentLineBC<CR>
map <Leader>fj :HopWordAC<CR>
map <Leader>fk :HopWordBC<CR>
map <Leader>fl :HopWordCurrentLineAC<CR>


"----- AirLine ------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline_section_error = ''
let g:airline_section_warning = ''

"----- GitGutter ------
" Disable gitgutter keybinds
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 20000

"----------------------------------------------  Language Config ----------------------------------------------
let g:python3_host_prog = "/usr/bin/python"

au BufRead,BufNewFile *.toml.j2 set filetype=toml
au BufRead,BufNewFile *.timer.j2 set filetype=systemd
au BufRead,BufNewFile *.service.j2 set filetype=systemd
au BufRead,BufNewFile *.netdev.j2 set filetype=systemd
au BufRead,BufNewFile *.network.j2 set filetype=systemd
au BufRead,BufNewFile *.conf.j2 set filetype=nginx
au BufRead,BufNewFile *.yaml.j2 set filetype=yaml
au BufRead,BufNewFile *.yml.j2 set filetype=yaml
au BufRead,BufNewFile .env.example set filetype=sh

"----------------------------------------------  Vim internal options ----------------------------------------------
"----- Basics settings ------
set shell=zsh                   " set zsh as standart vim shell
set history=1000                " 100 lines of command line history
set backspace=indent,eol,start  " full backspacing capabilities
set clipboard=unnamedplus       " yank and copy to X clipboard

" Backup settings
set noswapfile          " don't create a swap file
set nobackup            " don't keep a backup file

" Tabs and indenting
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
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
set showcmd             " show incomplete command at bottom of screen

" Wrapping
set nowrap              " Don't auto-wrap lines.

" Search stuff
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search
