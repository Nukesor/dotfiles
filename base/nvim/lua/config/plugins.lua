local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    ----- Libraries -----
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',

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
    {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp'
    },

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
            vim.opt.rtp:append(plugin.dir .. '/contrib/vim')
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
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
    },
    'antosha417/nvim-lsp-file-operations',

    ----- Navigation ------
    {
        'smoka7/hop.nvim',
        version = '*',
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        }
    },
    'lotabout/skim.vim',
    'lotabout/skim',
    'nvim-telescope/telescope.nvim',

    ----- Editing ------
    'terryma/vim-multiple-cursors',
    -- Easy bracket/quote manipulation
    'tpope/vim-surround',

    ----- Looks ------
    --'bling/vim-airline',
    'ap/vim-css-color',

    -- Colorschemes
    { "ellisonleao/gruvbox.nvim", name = "gruvbox", priority = 1000 },
    --'tomasiser/vim-code-dark',

    ----- Git support------
    -- Git command wrapper + integration
    'tpope/vim-fugitive',
    -- Vim integrated staging + conflict resolution
    --'jreybert/vimagit',
    -- Vim change indicator beside lines
    'airblade/vim-gitgutter',
});
