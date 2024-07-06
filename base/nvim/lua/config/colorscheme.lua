-- Gruvbox
vim.o.background = "dark";
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

-- Codedark:
--vim.g.codedark_modern = 1
--vim.g.airline_theme = 'codedark'
--vim.cmd([[colorscheme codedark]])
