-- Allow modeline-like filetype overwrite, without enabling modeline
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    desc = "Detect filetype modeline",
    callback = function(event)
        -- Read the first line
        local first_line = vim.api.nvim_buf_get_lines(event.buf, 0, 1, false);
        if #first_line == 0 then
            return
        end

        -- Look out for a filetype declaration.
        for match in string.gmatch(first_line[1], ".*filetype=(%w+)") do
            vim.bo.filetype = match
        end
    end,
})
