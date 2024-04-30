-- First up, load all plugins
require("config.plug")

-- Setup the completion engine via nvim-cmp
require("config.completion")

-- Configure and register all language servers.
require("config.lsp")

-- Setup formatting and auto-formatting
require("config.formatting")
