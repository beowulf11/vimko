vim.api.nvim_create_user_command("CopyPath", function()
    local path = vim.api.nvim_buf_get_name(0)
    vim.fn.setreg("+", path) -- "+" for system clipboard
    vim.notify("Copied path to clipboard:\n" .. path, 2)
end, {})
