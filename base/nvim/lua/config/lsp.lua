local vim = vim
vim.lsp.set_log_level("debug")

local lspconfig = require("lspconfig")

----- LSP autocompletion support -----
-- For nvim-cmp to properly work, we need to inject nvim_lsp as a provider
-- into the language servers.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

----- LSP keybinds -----
-- They'll be set as soon as a server attaches to a buffer.
-- See https://neovim.io/doc/user/lsp.html for all available functions
local lsp_attach = function(_client, buffer)
    local opts = { buffer = buffer, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gw", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "g[", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "g]", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>af", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<leader>ar", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>aw", vim.lsp.buf.code_action, opts)
    vim.keymap.set("v", "<leader>aw", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, opts)
end

----- Language server declaration and configuration -----
-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lsps = {
    ansiblels = {},
    bashls = {},
    dartls = {},
    html = {},
    jinja_lsp = {},
    jsonls = {},
    kotlin_language_server = {},
    lua_ls = {},
    marksman = {},
    pest_ls = {},
    ruff = {},
    rust_analyzer = {},
    tailwindcss = {},
    terraform_lsp = {},
    tsserver = {},
}

----- Language server initialization -----
for name, options in pairs(lsps) do
    -- Inject the nvim_lsp capabilities for proper completion support
    options["capabilities"] = capabilities
    -- Inject the keybindings
    options["on_attach"] = lsp_attach

    -- Run the server setup
    lspconfig[name].setup(options)
end
