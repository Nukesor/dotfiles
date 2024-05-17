local vim = vim

require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
    ensure_installed = {
        "bash",
        "c",
        "css",
        "diff",
        "dockerfile",
        "gdscript",
        "gitcommit",
        "gitignore",
        "graphql",
        "html",
        "java",
        "json",
        "just",
        "lua",
        "markdown",
        "markdown_inline",
        "make",
        "nix",
        "python",
        "regex",
        "rust",
        "scss",
        "ssh_config",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "query",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
    },

    -- Install parsers synchronously
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = false,

    -- List of parsers to ignore installing (or "all")
    ignore_install = {},

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- List of languages that will be disabled.
        -- These are the names of the parsers and not the filetype.
        -- disable = {},

        -- Don't use syntax highlighting for huge files.
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Might break things though.
        additional_vim_regex_highlighting = false,
    },
})
