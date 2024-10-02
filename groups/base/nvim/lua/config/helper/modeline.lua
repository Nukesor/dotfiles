-- Allow modeline-like filetype overwrite, without enabling modeline
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    desc = "Detect filetype modeline",
    callback = function(event)
        local allowed_filetypes = {
            "i3config",
        };

        -- Read the first line
        local first_line = vim.api.nvim_buf_get_lines(event.buf, 0, 1, false);
        if #first_line == 0 then
            return
        end

        -- Look out for a filetype declaration.
        for match in string.gmatch(first_line[1], ".*filetype=(%w+)") do
            -- If we allow this filetype, set it.
            for _, filetype in ipairs(allowed_filetypes) do
                if filetype == match then
                    vim.cmd(string.format("set filetype=%s", match))
                end
            end
        end
    end,
})
