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
        "git_config",
        "git_rebase",
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
        "sql",
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

    highlight = {
        enable = true,

        -- Don't use syntax highlighting for huge files.
        disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },

    additional_vim_regex_highlighting = false,
})
