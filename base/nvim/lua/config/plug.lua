-- Redefine global `vim` to avoid undefined warnings
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plug')

----- Language setup ------
-- Language server support
Plug('neovim/nvim-lspconfig')
Plug('nvimdev/lspsaga.nvim')

-- Auto completions
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('L3MON4D3/LuaSnip')

-- Formatting
Plug('mhartington/formatter.nvim')

-- Languages without LSP support
Plug('nginx/nginx', { ['rtp'] = 'contrib/vim' })
Plug('hashivim/vim-hashicorp-tools')
Plug('m-pilia/vim-pkgbuild')
Plug('NoahTheDuke/vim-just')

----- Looks ------
Plug('bling/vim-airline')
Plug('Valloric/MatchTagAlways')
Plug('ap/vim-css-color')

-- Colorschemes
Plug('morhetz/gruvbox')
Plug('tomasiser/vim-code-dark')
Plug('Luxed/ayu-vim')

----- Tooling ------
Plug('nvim-treesitter/nvim-treesitter')

-- Package managers
--Plug('saecki/crates.nvim', { ['tag']= 'stable' })

----- Editing ------
Plug('nvim-treesitter/nvim-treesitter')
Plug('terryma/vim-multiple-cursors')
--  Toggle comments in front of lines via 'gc'
Plug('tomtom/tcomment_vim')
-- Easy bracket/quote manipulation
Plug('tpope/vim-surround')
-- Multi-file search + replace
Plug('dyng/ctrlsf.vim')

----- Git support------
-- Git command wrapper + integration
Plug('tpope/vim-fugitive')
-- Vim integrated staging + conflict resolution
Plug('jreybert/vimagit')
-- Vim change indicator beside lines
Plug('airblade/vim-gitgutter')

----- Navigation ------
-- Vimium-like motion helper for vim
Plug('easymotion/vim-easymotion')
Plug('scrooloose/nerdtree')
-- File tree
--Plug('nvim-tree/nvim-tree.lua'
-- Code-overview in sidebuffer. Classes, functions, structs, etc.
--Plug(vim-scripts/taglist.vim'
-- Fast and interactive search stuff
Plug('lotabout/skim.vim')
Plug('lotabout/skim')

vim.call('plug#end')
