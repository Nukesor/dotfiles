-- Configure telescope keybinds
local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>w", builtin.lsp_dynamic_workspace_symbols)
vim.keymap.set("n", "<leader>r", builtin.live_grep)

-- TODO: I' would like to have either Skim or Telescope
-- Right now, there's no nice way to add prximity-sort's logic to Telescope
-- yet, which is kind of a dealbreaker.
--nnoremap <silent> <C-p> :Telescope find_files<CR>

telescope.setup({
    defaults = {
        layout_config = {
            width = 0.90
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                -- Open in split/tab
                ["<C-i>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            },
            n = {
                ["q"] = actions.close,
            }
        },
        pickers = {
            lsp_workspace_symbols = {
                ignore_filename = true,
            },
        },
    }
})
