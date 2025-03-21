-- Utilities for creating configurations
local formatter = require("formatter");
local util = require "formatter.util"

-- Editorconfig
-- neovim has built-in editorconfig support since 0.9
-- https://neovim.io/doc/user/editorconfig.html
--
-- The rules will be enforced on write to disk.

------- LSP -------
-- Use language servers for formatting wherever we can.
-- This is mounted in the lsp_attach function in the lsp module.
-- Use language servers wherever we can.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    desc = "nvim-lsp autoformat on write",
    pattern = {
        "*.html",
        "*.lua",
        "*.j2",
        "*.json",
        "*.py",
        "*.rs",
        "*.tf",
        "*.toml",
        "*.ts",
        "*.tsx",
    },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

------- formatter.nvim
local function yamlfmt()
    local yamlfmt_config = require("formatter.filetypes.yaml").yamlfmt();
    table.insert(yamlfmt_config['args'], "-formatter");
    table.insert(yamlfmt_config['args'], "retain_line_breaks=true");
    return yamlfmt_config
end

-- Setup the formatter.nvim plugin.
-- What's interesting is, that all formatters are opt-in **only**.
--
-- We use this to format everything that has no LSP support.
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands.
--
-- Check for presets over here:
-- https://github.com/mhartington/formatter.nvim?tab=readme-ov-file#opt-in-formatters
formatter.setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        terraform = {
            require("formatter.filetypes.terraform").terraformfmt,
        },
        sh = {
            require("formatter.filetypes.sh").shfmt,
        },
        yaml = {
            yamlfmt,
        },
        markdown = {
            function()
                -- mdformat doesn't play well with some formats such as the zola metainfo
                -- Zola adds toml at the top of the Markdown file, which then get's formatted in a way
                -- that breaks the zola build.
                --
                -- Read the first line of the current buffer
                -- Zola documents always start with a `+++` prefix for their metadata
                -- If we find such a thing, use prettier instead of mdformat.
                local lines = vim.api.nvim_buf_get_lines(0, 0, 1, false);
                if string.find(lines[1], "noformat") then
                    return nil
                end
                if lines[1] ~= "+++" then
                    return require("formatter.filetypes.markdown").prettier();
                end

                -- Otherwise use mdformat as a default
                return require("formatter.filetypes.markdown").mdformat()
            end
        },
        -- Custom formatter for typst
        typst = {
            function()
                local filename = util.get_current_buffer_file_name()
                return {
                    exe = "typstyle",
                    stdin = true,
                }
            end
        }
    },
});

-- Run FormatWrite on all buffers post write.
-- We do post-write because it would conflict with nvim's builtin editorconfig formatting otherwise.
-- Since it's opt-in only, it'll only be called on the files we specified
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
    group = "__formatter__",
    command = ":FormatWrite",
})
