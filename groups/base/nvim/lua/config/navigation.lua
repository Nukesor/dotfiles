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
    hop.hint_words({ direction = directions.AFTER_CURSOR })
end)
vim.keymap.set("n", "<Leader>fk", function()
    hop.hint_words({ direction = directions.BEFORE_CURSOR })
end)
-- Hop inside same line
vim.keymap.set("n", "<Leader>fh", function()
    hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end)
vim.keymap.set("n", "<Leader>fl", function()
    hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = true })
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
        file_ignore_patterns = {
            -- Arch linux translation files
            "/po/"
        },
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

-- Custom proximity search implementation
local conf = require("telescope.config").values
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local pickers = require "telescope.pickers"
local sorters = require "telescope.sorters"

function starts_with(str, prefix)
    return string.sub(str, 1, string.len(prefix)) == prefix
end

local function get_relative_buffer_path()
    local full_path = vim.api.nvim_buf_get_name(0)
    -- In case one of the following conditions apply, use the cwd.
    -- - We aren't in a file buffer.
    -- - The filename is empty.
    -- - The path isn't absolut.e.
    if full_path == nil or
        full_path == '' or
        not starts_with(full_path, '/') then
        return '.'
    end

    -- Return the relative path of the buffer to the current cwd.
    -- That's what proxmity sort expects.
    local cwd = vim.fn.getcwd()
    local relative_path = string.gsub(full_path, cwd .. '/', '')
    -- Fallback to the cwd if:
    -- - The path equals the cwd.
    -- - We're in a neo-tree buffer
    if relative_path == '' or starts_with(full_path, 'neo-tree') then
        return '.'
    end
    return relative_path
end

-- A file picker that sorts entries based on the proximity of files relative to
-- the file path of the current buffer.
-- Requires the `proximity-sort` and `fd` binaries to be present.
local proximity_files = function(opts)
    local path = get_relative_buffer_path()
    -- print(string.format("Relative proximity path: '%s'", path))

    local live_fd = finders.new_job(
        function(prompt)
            if not prompt or prompt == "" then
                prompt = "."
            end

            local command = {
                "bash",
                "-c",
                string.format('fd --full-path --type f . | sk --exact --filter %s | proximity-sort %s',
                    vim.fn.shellescape(prompt), vim.fn.shellescape(path)),
            }
            -- print("Cmd: ", vim.inspect(cmd))
            return command
        end,
        opts.entry_maker or make_entry.gen_from_file(opts),
        opts.max_results,
        opts.cwd
    )

    pickers
        .new(opts, {
            prompt_title = "Proximity Files",
            finder = live_fd,
            previewer = conf.file_previewer(opts),
            sorter = sorters.highlighter_only(opts),
            push_cursor_on_edit = true,
            __locations_input = true,
        })
        :find()
end

vim.keymap.set("n", "<C-p>", function() proximity_files({}) end)
