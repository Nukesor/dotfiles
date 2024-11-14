-- ####### Builtin #######
local cmd = vim.api.nvim_command

-- Remap Window Navigation
vim.keymap.set("n", "<Leader>h", function() cmd('wincmd h') end)
vim.keymap.set("n", "<Leader>j", function() cmd('wincmd j') end)
vim.keymap.set("n", "<Leader>k", function() cmd('wincmd k') end)
vim.keymap.set("n", "<Leader>l", function() cmd('wincmd l') end)

-- Window resizing
vim.keymap.set("n", "<C-j>", function() cmd('resize -5') end)
vim.keymap.set("n", "<C-k>", function() cmd('resize +5]') end)
vim.keymap.set("n", "<C-h>", function() cmd('vertical resize +10') end)
vim.keymap.set("n", "<C-l>", function() cmd('vertical resize -10') end)

-- Windows splitting
vim.keymap.set("n", "<Leader>v", function() cmd('vsplit') end)
vim.keymap.set("n", "<Leader>i", function() cmd('split') end)
vim.keymap.set("n", "<Leader>t", function()
    -- Open new tab with neotree and the cursor in the right buffer
    cmd('tabnew')
    cmd('Neotree source=filesystem')
    cmd('wincmd l')
end)

-- ####### Other Plugins #######

-- [Unimpaired] Switch between next/previous quickfix entry
vim.keymap.set("n", "[q", function() vim.cmd [[:cnext]] end)
vim.keymap.set("n", "]q", function() vim.cmd [[:cprevious]] end)

-- [Hop] Hop to words in current view
local hop = require('hop')
local directions = require('hop.hint').HintDirection
-- Hop to other lines
vim.keymap.set("n", "<Leader>fj", function()
    hop.hint_char1({ direction = directions.AFTER_CHAR })
end)
vim.keymap.set("n", "<Leader>fk", function()
    hop.hint_char1({ direction = directions.BEFORE_CHAR })
end)
-- Hop inside same line
vim.keymap.set("n", "<Leader>fh", function()
    hop.hint_char1({ direction = directions.BEFORE_CHAR, current_line_only = true })
end)
vim.keymap.set("n", "<Leader>fl", function()
    hop.hint_char1({ direction = directions.AFTER_CHAR, current_line_only = true })
end)


-- ####### Telescope keybinds #######
local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- Live grep search
vim.keymap.set("n", "<leader>r", builtin.live_grep)
-- Search workspace symbols
vim.keymap.set("n", "<leader>w", builtin.lsp_dynamic_workspace_symbols)

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
