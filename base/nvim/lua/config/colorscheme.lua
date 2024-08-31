-- Gruvbox
require("gruvbox").setup({
    terminal_colors = true,
    undercurl = true,
    underline = true,
    italic = {
        strings = false,
        emphasis = true,
        comments = false,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "",  -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
})
vim.cmd([[colorscheme gruvbox]])
vim.o.background = "dark";

-- Codedark:
--vim.g.codedark_modern = 1
--vim.g.airline_theme = 'codedark'
--vim.cmd([[colorscheme codedark]])


vim.api.nvim_create_user_command('Light',
    function(opts)
        vim.o.background = "light";
    end,
    { nargs = 0 })

vim.api.nvim_create_user_command('Dark',
    function(opts)
        vim.o.background = "dark";
    end,
    { nargs = 0 })
