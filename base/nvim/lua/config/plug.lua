-- Redefine global `vim` to avoid undefined warnings
local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Set the map leader for custom commands
vim.g.mapleader = ","

require("lazy").setup({
    ----- Libraries -----
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",

    ----- Language setup ------
    -- Language server support
    'neovim/nvim-lspconfig',
    'nvimdev/lspsaga.nvim',

    ----- Auto completions ------
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',

    ----- Formatting ------
    'mhartington/formatter.nvim',

    ----- Syntax highlighting ------
    {
        'nvim-treesitter/nvim-treesitter',
        config = function(_)
            vim.cmd('TSUpdate')
        end
    },
    -- Languages without treesitter
    {
        'nginx/nginx',
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/contrib/vim")
        end
    }
    ,
    'm-pilia/vim-pkgbuild',
    'NoahTheDuke/vim-just',

    ----- Tree ------
    {
        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        version = '2.*',
        config = function()
            require 'window-picker'.setup()
        end,
    },
    "nvim-tree/nvim-web-devicons",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
    },
    "antosha417/nvim-lsp-file-operations",

    ----- Looks ------
    'bling/vim-airline',
    'Valloric/MatchTagAlways',
    'ap/vim-css-color',

    -- Colorschemes
    'morhetz/gruvbox',
    'tomasiser/vim-code-dark',
    'Luxed/ayu-vim',

    ----- Editing ------
    'terryma/vim-multiple-cursors',
    --  Toggle comments in front of lines via 'gc'
    'tomtom/tcomment_vim',
    -- Easy bracket/quote manipulation
    'tpope/vim-surround',
    -- Multi-file search + replace
    'dyng/ctrlsf.vim',

    ----- Git support------
    -- Git command wrapper + integration
    'tpope/vim-fugitive',
    -- Vim integrated staging + conflict resolution
    --'jreybert/vimagit',
    -- Vim change indicator beside lines
    'airblade/vim-gitgutter',

    ----- Navigation ------
    -- Vimium-like motion helper for vim
    'easymotion/vim-easymotion',
    'lotabout/skim.vim',
    'lotabout/skim'
});
