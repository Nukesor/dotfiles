vim.lsp.set_log_level("debug")

local file_helper = require("config.helper.file")

-- To enable lsp log if necessary for debugging, set log to
-- "debug", "info"
vim.lsp.set_log_level("off")

----- LSP autocompletion support -----
-- For nvim-cmp to properly work, we need to inject nvim_lsp as a provider
-- into the language servers.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.diagnostic.config({
    underline = true,
    virtual_text = false,
})

----- LSP keybinds -----
-- They'll be set as soon as a server attaches to a buffer.
-- See https://neovim.io/doc/user/lsp.html for all available functions
local lsp_attach = function(_, buffer)
    local opts = { buffer = buffer, remap = false }

    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>af", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<leader>ar", function() vim.cmd('Lspsaga rename') end, opts)
    vim.keymap.set("n", "<leader>aw", function() vim.cmd('Lspsaga code_action') end, opts)
    vim.keymap.set("v", "<leader>aw", function() vim.cmd('Lspsaga code_action') end, opts)
    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>sr", function() vim.cmd('Lspsaga finder') end, opts)
    vim.keymap.set("n", "<leader>so", function() vim.cmd('Lspsaga outline') end, opts)
    vim.keymap.set("n", "<leader>si", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, opts)
    -- Swap the default diagnostics jumps around (more intuitive for me)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
end

-- Disable server cancelation errors for now
-- https://github.com/neovim/neovim/issues/30985
-- https://old.reddit.com/r/rust/comments/1geyfld/rustanalyzer_server_cancelled_the_request_in/
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end

----- Language server declaration and configuration -----
-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- https://github.com/williamboman/mason-lspconfig.nvim
local servers = {
    ansiblels = {},
    bashls = {},
    cssls = {},
    html = {},
    jinja_lsp = {},
    jsonls = {},
    lua_ls = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            }
        },
    },
    marksman = {}, -- Markdownls
    pyright = {},  -- python type checker
    ruff = {},     -- python linter + formatter
    rust_analyzer = {
        ['rust-analyzer'] =
        {
            check = { allTargets = true, command = "clippy" },
            procMacro = { enable = true },
            diagnostics = {
                disabled = {
                    "unresolved-proc-macro",
                    "unresolved-macro-call",
                    "macro-error",
                }
            },
        }
    },
    tailwindcss = {},
    taplo = {},    -- toml
    terraformls = {},
    tinymist = {}, -- typst
    ts_ls = {},
}

-- Always install these lsps via mason
local ensure_installed = {
    --"terraformls",
}

require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require("lspconfig")


-- Detect jinja templates
vim.filetype.add {
    extension = {
        jinja = 'jinja',
        jinja2 = 'jinja',
        j2 = 'jinja',
    },
}

----- Language server initialization -----
-- Example file looks like this
-- {
--     "rust_analyzer": {
--         "rust-analyzer": {
--             "cargo": {
--                 "features": [
--                     "integration-test"
--                 ]
--             }
--         }
--     }
-- }
local local_config = file_helper.get_json_file('/./.vim/settings.json');
--print(vim.inspect(local_config))

for name, settings in pairs(servers) do
    local options = {}
    -- Inject the nvim_lsp capabilities for proper completion support
    options["capabilities"] = capabilities
    -- Inject the keybindings
    options["on_attach"] = lsp_attach

    -- Temporary workaround for https://github.com/Myriad-Dreamin/tinymist/issues/638
    if name == "tinymist" then
        options["offset_encoding"] = "utf-8"
    end

    -- Load any configuration for this lsp if provided.
    if (local_config[name] ~= nil) then
        settings = vim.tbl_deep_extend(
            "force",
            local_config[name],
            settings
        )
        --print(vim.inspect(settings))
    end

    -- Set custom LSP settings
    options["settings"] = settings


    -- Print options for a specific server (debugging)
    --if name == "rust_analyzer" then
    --    print(vim.inspect(options))
    --end

    -- Run the server setup
    lspconfig[name].setup(options)
end

----- lspsaga improvements -----
-- See docs for more info:
-- https://nvimdev.github.io/lspsaga/
--
-- What does it do:
-- - Breadcrumb bar at the top of the buffer
-- - Floating rename
-- - Floating diagnostics with preview
-- - Usage finder popup
-- - File structure utline window
-- - Lightbulb on LSP hints
require('lspsaga').setup({
    symbol_in_winbar = {
        -- I really like the bar, but fugitive's blame is no longer alligned
        -- when the breadcrumb bar is inserted at the top of the buffer.
        enable = false,
    },
    rename = {
        in_select = false,
        keys = {
            quit = "<Esc>",
        }
    },
    code_action = {
        keys = {
            quit = "<Esc>",
        }
    },
    finder = {
        default = 'ref',
        max_height = 0.6,
    }
})
