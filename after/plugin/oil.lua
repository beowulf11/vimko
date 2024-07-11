require("oil").setup({
    lsp_file_methods = {
        autosave_changes = "unmodified",
    },

    view_options = {
        show_hidden = true,
    }
})

vim.keymap.set("n", "<space>-", require("oil").toggle_float)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
