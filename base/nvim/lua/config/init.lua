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

-- Setup File Tree
require("config.tree")

-- Load helper files
require("config.helper")
