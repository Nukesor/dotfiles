-- Map proper filetypes for templating.
local template_mappings = {
    { '*.timer.j2,*.service.j2,*.netdev.j2,*.network.j2', 'systemd' },
    { '*.conf.j2',                                        'nginx' },
    { '*.yaml.j2,*.yml.j2',                               'yaml' },
    { '.env.example',                                     'sh' },
}

for i, mapping in pairs(template_mappings) do
    vim.api.nvim_create_autocmd(
        { 'BufRead', 'BufNewFile' },
        {
            pattern = mapping[1],
            callback = function()
                local buf = vim.api.nvim_get_current_buf()
                vim.api.nvim_buf_set_option(buf, "filetype", mapping[2])
            end,
        }
    )
end

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

-- Markview setup
require("markview").setup({
    preview = {
        enable = false,
    }
});
