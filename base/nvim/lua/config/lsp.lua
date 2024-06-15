vim.lsp.set_log_level("debug")

local file_helper = require("config.helper.file")
local lspconfig = require("lspconfig")

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
    vim.keymap.set("n", "gw", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>af", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<leader>ar", function() vim.cmd('Lspsaga rename') end, opts)
    vim.keymap.set("n", "<leader>aw", function() vim.cmd('Lspsaga code_action') end, opts)
    vim.keymap.set("v", "<leader>aw", function() vim.cmd('Lspsaga code_action') end, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>sr", function() vim.cmd('Lspsaga finder') end, opts)
    vim.keymap.set("n", "<leader>so", function() vim.cmd('Lspsaga outline') end, opts)
    vim.keymap.set("n", "<leader>si", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, opts)
end

----- Language server declaration and configuration -----
-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
    ansiblels = {},
    bashls = {},
    dartls = {},
    html = {},
    jinja_lsp = {},
    jsonls = {},
    kotlin_language_server = {},
    lua_ls = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            }
        },
    },
    marksman = {},
    pest_ls = {},
    pyright = {},
    ruff = {},
    rust_analyzer = {
        ['rust-analyzer'] = vim.tbl_deep_extend(
            "force",
            file_helper.get_json_file('/./.rust-analyzer.json'),
            -- Overrides (forces these regardless of what's in .rust-analyzer.json
            -- See https://rust-analyzer.github.io/manual.html#configuration
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
        )
    },
    tailwindcss = {},
    terraform_lsp = {},
    tsserver = {},
}

----- Language server initialization -----
for name, settings in pairs(servers) do
    local options = {}
    -- Inject the nvim_lsp capabilities for proper completion support
    options["capabilities"] = capabilities
    -- Inject the keybindings
    options["on_attach"] = lsp_attach

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

-- Get a fancy breadcrumb bar
require('lspsaga.symbol.winbar').get_bar()
