local vim = vim

local module = {}

function module.get_json_file(path)
    local handle = io.open(vim.fn.resolve(vim.fn.getcwd() .. path))
    if not handle then
        return {}
    end
    local out = handle:read("*a")
    handle:close()
    local config = vim.json.decode(out)
    if type(config) == "table" then
        return config
    end
    return {}
end

return module
