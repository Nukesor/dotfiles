local vim = vim;

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
    { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
    { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
    { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
    { text = "󰌵", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
    -- Close Neo-tree if it is the last window left in the tab
    close_if_last_window = false,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    -- when opening files, do not use windows containing these filetypes or buftypes
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
    -- used when sorting files and directories in the tree
    sort_case_insensitive = true,
    default_component_configs = {
        container = {
            enable_character_fade = false
        },
        indent = {
            indent_size = 2,
            -- extra padding on left hand side
            padding = 1,
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- Expander config, needed for nesting files
            -- if nil and file nesting is enabled, will enable expanders
            with_expanders = false,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
        },
        name = {
            trailing_slash = true,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
        git_status = {
            symbols = {
                -- Change type
                --- or "✚", but this is redundant info if you use git_status_colors on the name
                added     = "",
                --- or "", but this is redundant info if you use git_status_colors on the name
                modified  = "",
                --- this can only be used in the git_status source
                deleted   = "✖",
                --- this can only be used in the git_status source
                renamed   = "󰁕",
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "󰄱",
                staged    = "",
                conflict  = "",
            }
        },
        -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
        file_size = {
            enabled = true,
            required_width = 64, -- min width of window required to show this column
        },
        type = {
            enabled = true,
            required_width = 122, -- min width of window required to show this column
        },
        last_modified = {
            enabled = true,
            required_width = 88, -- min width of window required to show this column
        },
        created = {
            enabled = true,
            required_width = 110, -- min width of window required to show this column
        },
        symlink_target = {
            enabled = false,
        },
    },
    event_handlers = {
        -- Enter visual mode for pop-up windows
        {
            event = "neo_tree_popup_input_ready",
            handler = function(args)
                vim.cmd("stopinsert")
                vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
            end,
        }
    },
    -- A list of functions, each representing a global custom command
    -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
    -- see `:h neo-tree-custom-commands-global`
    commands = {},
    window = {
        position = "left",
        width = 40,
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["o"] = { "open", nowait = true },
            ["O"] = "open_with_window_picker",
            ["<2-LeftMouse>"] = "open",
            -- close preview or floating neo-tree window
            ["<esc>"] = "cancel",
            -- Read `# Preview Mode` for more information
            ["l"] = "focus_preview",
            ["h"] = "open_split",
            ["s"] = "open_vsplit",
            ["H"] = "split_with_window_picker",
            ["S"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- enter preview mode, which shows the current node without focusing
            --["P"] = "toggle_preview",
            ["C"] = "close_node",
            -- ['C'] = 'close_all_subnodes',
            ["z"] = "close_all_nodes",
            ["a"] = {
                "add",
                -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc).
                -- See `:h neo-tree-file-actions` for details
                -- Some commands may take optional config options, see `:h neo-tree-mappings` for details
                config = {
                    show_path = "absolute" -- "none", "relative", "absolute"
                }
            },
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = {
                "copy",
                config = {
                    -- "none", "relative", "absolute"
                    show_path = "absolute"
                }
            },
            ["m"] = {
                "move",
                config = {
                    -- "none", "relative", "absolute"
                    show_path = "absolute"
                }
            },
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
            ["i"] = "show_file_details",

            -- Remove ordering keymaps.
            -- Otherwise when pressing `o` to open files, no action is performed until
            -- a second keypress is performed
            ["oc"] = "noop",
            ["od"] = "noop",
            ["og"] = "noop",
            ["om"] = "noop",
            ["on"] = "noop",
            ["os"] = "noop",
            ["ot"] = "noop",
            --["oc"] = { "order_by_created", nowait = false },
            --["od"] = { "order_by_diagnostics", nowait = false },
            --["og"] = { "order_by_git_status", nowait = false },
            --["om"] = { "order_by_modified", nowait = false },
            --["on"] = { "order_by_name", nowait = false },
            --["os"] = { "order_by_size", nowait = false },
            --["ot"] = { "order_by_type", nowait = false },
        }
    },
    nesting_rules = {},
    filesystem = {
        filtered_items = {
            -- When true, they will just be displayed differently than normal items
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_by_name = {
                --"node_modules"
            },
            hide_by_pattern = { -- uses glob style patterns
                --"*.meta",
                --"*/src/*/tsconfig.json",
            },
            -- remains visible even if other settings would normally hide it
            always_show = {
                ".gitignore",
            },
            -- remains hidden even if visible is toggled to true, this overrides always_show
            never_show = {
            },
            never_show_by_pattern = { -- uses glob style patterns
                --".null-ls_*",
            },
        },
        follow_current_file = {
            -- This will find and focus the file in the active buffer every time
            enabled = true,
            -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            leave_dirs_open = true,
        },
        -- when true, empty folders will be grouped together
        group_empty_dirs = false,
        -- "open_default" netrw is disabled, opening a directory opens neo-tree in
        --      whatever position is specified in window.position
        -- "open_current", netrw disabled, opening a directory opens within the
        --      window like netrw would, regardless of window.position
        -- "disabled", netrw left alone, neo-tree does not handle opening dirs
        hijack_netrw_behavior = "open_default",
        -- "false" will use OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
        use_libuv_file_watcher = false,
        window = {
            mappings = {
                ["<bs>"]  = "navigate_up",
                ["."]     = "set_root",
                ["I"]     = "toggle_hidden",
                ["/"]     = "fuzzy_finder",
                ["D"]     = "fuzzy_finder_directory",
                ["#"]     = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                -- ["D"] = "fuzzy_sorter_directory",
                ["f"]     = "filter_on_submit",
                ["<c-x>"] = "clear_filter",
                ["[g"]    = "prev_git_modified",
                ["]g"]    = "next_git_modified",
                -- ['<key>'] = function(state) ... end,
                --
                ["A"]     = "git_add_all",
                ["gu"]    = "git_unstage_file",
                ["ga"]    = "git_add_file",
                ["gr"]    = "git_revert_file",
                ["gc"]    = "git_commit",
                ["gp"]    = "git_push",
                ["gg"]    = "git_commit_and_push",
            },
            -- define keymaps for filter popup window in fuzzy_finder_mode
            fuzzy_finder_mappings = {
                ["<C-n>"] = "move_cursor_down",
                ["<C-p>"] = "move_cursor_up",
            },
        },

        commands = {} -- Add a custom command or override a global one using the same function name
    },
    buffers = {
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        show_unloaded = true,
        window = {
            mappings = {
                ["bd"] = "buffer_delete",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
            }
        },
    },
})

vim.cmd([[nnoremap \ :Neotree reveal<cr>]])


-- Setup LSP file operation integration for Neo-tree
require("lsp-file-operations").setup({
    timeout_ms = 2000,
})
