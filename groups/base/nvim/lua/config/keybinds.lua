-- This module contains vim specific general purpose keybinds that don't
-- require a plugin or match specific scope.

-- Save with CTRL-s
vim.keymap.set("n", "<C-S>", function() vim.cmd [[:update]] end)
vim.keymap.set("v", "<C-S>", function() vim.cmd [[:update]] end)
vim.keymap.set("i", "<C-S>", function() vim.cmd [[:update]] end)

-- Fast quit shortcut
vim.keymap.set("n", "<Leader>q", function() vim.cmd [[:quit]] end)
vim.keymap.set("n", "<Leader>Q", function() vim.cmd [[:quitall]] end)

-- Enable spell
vim.keymap.set("n", "F8", function() vim.cmd [[:set spell spellang=en_us]] end)
