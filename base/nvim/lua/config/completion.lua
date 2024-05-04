-- Completion is done using the `nvim-cmp` plugin
-- https://github.com/hrsh7th/nvim-cmp
local vim = vim
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

----- Base setup/config -----
cmp.setup({
    -- Don't auto-select anything
    preselect = cmp.PreselectMode.None,
    snippet = {
        -- Specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    -- The mapping for nvim-cmp
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm(),
        ["<Space>"] = cmp.mapping(function(fallback)
            -- This little function allows to select entries with space.
            -- However, it only does so, if an entry is selected and it's not a snippet.
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                -- If no entry is selected, just continue typing as usual
                if not entry then
                    fallback()
                    return
                end

                -- Snippets have their own cursor position after insertion, so we don't want
                -- to add any whitespaces in that scenario.
                local source = entry['source']['name']
                if source == 'luasnip' then
                    cmp.confirm({ select = true })
                    return
                end

                -- Select and insert a space afterwards
                cmp.confirm({ select = true }, function()
                    vim.api.nvim_paste(" ", false, -1)
                end)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    -- Get completions from nvim's LSP client and the Snippet engine
    -- Include the same buffer for completion as well?
    -- There're more completions for various stuff that doesn't have an LSP:
    -- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

----- Custom setup/config -----

-- Super fancy crates completion for cargo
--cmp.setup.filetype('Cargo.toml', {
--    sources = cmp.config.sources({
--        { name = 'crates' },
--    })
--})

-- Autocompletion in buffer search for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Autocompletion in cmdline for ':'
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
