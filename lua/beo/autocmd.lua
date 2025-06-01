vim.api.nvim_create_augroup("beo", { clear = true })

-- removes trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "beo",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = "beo",
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'DiffAdd', timeout = 200 }
    end
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    group = "beo",
    callback = function()
        if vim.w.auto_cursorline then
            vim.wo.cursorline = true
            vim.w.auto_cursorline = nil
        end
    end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
    group = "beo",
    callback = function()
        if vim.wo.cursorline then
            vim.w.auto_cursorline = true
            vim.wo.cursorline = false
        end
    end,
})
