-- Set file encoding before we do anything else.
vim.g.encoding = "utf-8"
vim.g.fileencoding = "utf-8"

-- Load the config module located in `lua/config/init.lua`
-- This handles all plugin logic and any configuration logic that's a bit more involved.
require("config")

-- Load a init.vim style vim configuration.
-- This contains basic configurations for which Lua would be overkill.
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
