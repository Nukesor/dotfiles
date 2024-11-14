-- First up, load all plugins
require("config.plugins")

-- Configure colorscheme
require("config.colorscheme")

-- Setup the completion engine via nvim-cmp
require("config.completion")

-- Configure and register all language servers.
require("config.lsp")

-- Setup formatting and auto-formatting
require("config.formatting")

-- Setup formatting and auto-formatting
require("config.highlighting")

-- Configure navigation and code search (mostly keybinds)
require("config.navigation")

-- Setup File Tree
require("config.tree")

-- Load helper files
require("config.helper")

-- Load helper files
require("config.keybinds")
