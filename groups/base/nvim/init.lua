-- ######## Required global neovim lua config ########

-- Set file encoding before we do anything else.
vim.g.encoding     = 'utf-8'
vim.g.fileencoding = 'utf-8'

-- Set the map leader for custom commands
vim.g.mapleader    = ';'

-- ######## Basic Neovim config ########

-- General settings
vim.opt.shell      = 'fish'             -- set fish as standart vim shell
vim.opt.history    = 1000               -- 100 lines of command line history
vim.opt.backspace  = 'indent,eol,start' -- full backspacing capabilities
vim.opt.clipboard  = 'unnamedplus'      -- yank and copy to X clipboard

-- Split/tab behavior
vim.opt.splitbelow = true -- hsplit opens below current window
vim.opt.splitright = true -- ssplit opens right of current window


-- Disable backups settings
vim.opt.swapfile = false -- don't create a swap file
vim.opt.backup = false   -- don't keep a backup file

-- Tabs and indenting
vim.opt.expandtab = true -- insert spaces instead of tab chars
vim.opt.tabstop = 4 -- a n-space tab width
vim.opt.shiftwidth = 4 -- allows the use of < and > for VISUAL indenting
vim.opt.softtabstop = 4 -- counts n spaces when DELETE or BCKSPCE is used
vim.opt.listchars = 'tab:→,trail:¸' -- show trail spaces and tabstchars

vim.opt.showmode = true -- show mode at bottom of screen
vim.opt.showmatch = true --  show matching brackets (),{},[]
vim.opt.matchpairs:append("<:>")
vim.opt.signcolumn = 'number' -- show the line number

-- Cursor highlighting
vim.opt.cursorline = true   -- highlight cursor line
vim.opt.cursorcolumn = true -- highlight cursor column (breaks completion preview)

-- Visual Sugar
vim.opt.ruler = true    -- ruler display in status line
vim.opt.number = true   -- show line numbers
vim.opt.showmode = true -- show mode at bottom of screen
vim.opt.showcmd = true  -- show incomplete command at bottom of screen
---- Set the title to the filename of the current buffer
vim.opt.title = true
vim.api.nvim_create_autocmd(
    { 'BufEnter' },
    {
        pattern = '*',
        callback = function()
            vim.cmd [[let &titlestring = "neovim: " . expand("%:t")]]
        end,
    }
)


-- Wrapping
vim.opt.wrap = false -- Don't auto-wrap lines.

-- Search stuff
vim.opt.hlsearch = true   -- highlight all search results
vim.opt.incsearch = true  -- increment search
vim.opt.ignorecase = true -- case-insensitive search
vim.opt.smartcase = true  -- upper-case sensitive search

-- Navigation
vim.opt.mouse = 'a' -- make sure mouse is used in all cases.

-- Spell
--vim.opt.spelllang = 'en_us,de'
--vim.opt.spell = true

-- Vim sudo workaround
vim.cmd [[cnoreabbrev w!! w ! sudo tee % > /dev/null]]

-- Disable F1 help
vim.keymap.set("n", "F1", function() end)
vim.keymap.set("i", "F1", function() end)

-- ######## Lua config ########
-- Load the config module located in `lua/config/init.lua`
-- This handles all plugin logic and any configuration logic that's a bit more involved.
require('config')
