if not require("beo/utils").plugin_exists("conform.nvim") then
    return
end

require("conform").setup({
    log_level = vim.log.levels.DEBUG,
    formatters_by_ft = {
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        python = { 'black' },
        astro = { "prettier" },
    },
})

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({
        async = true,
        quiet = false,
        lsp_format = "fallback",
        range = range,
    })
end, { range = true })

vim.keymap.set("n", "<leader>f", vim.cmd.Format);
