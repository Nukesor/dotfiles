-- Utilities for creating configurations
local vim = vim
local formatter = require("formatter")

-- Editorconfig
-- neovim has built-in editorconfig support since 0.9
-- https://neovim.io/doc/user/editorconfig.html
--
-- The rules will be enforced on write to disk.

-- Use language servers wherever we can.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    desc = "nvim-lsp autoformat on write",
    pattern = {
        "*.dart",
        "*.html",
        "*.lua",
        "*.j2",
        "*.md",
        "*.pest",
        "*.py",
        "*.rs",
        "*.tf",
        "*.ts",
        "*.tsx",
    },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

function mdformat()
  return {
    exe = "mdformat",
    args = { "-" },
    stdin = true,
  }
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
        yaml = {
            require("formatter.filetypes.yaml").prettier,
        },
        markdown = {
            mdformat,
        },
    },
})

-- Run FormatWrite on all buffers post write.
-- Since it's opt-in only, it'll only be called on the files we specified
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
    group = "__formatter__",
    command = ":FormatWrite",
})
