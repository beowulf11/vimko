vim.opt.completeopt = { "menu", "menuone", "preview" }

-- local lspkind = require("lspkind")
-- lspkind.init()

vim.lsp.enable({
    'pyright',
    'lua_ls',
    'ts_ls',
    'svelte',
    'tailwindcss',
    'prettier',
    'biome',
    'docker_compose_language_service',
    'eslint_ls',
    'html-lsp',
})

vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({
        count = 1,
        float = true,
    })
end)
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({
        count = -1,
        float = true,
    })
end)


vim.keymap.set("n", "]D", function()
    vim.diagnostic.jump({
        count = 1,
        float = true,
        severity = vim.diagnostic.severity.ERROR,
    })
end)
vim.keymap.set("n", "[D", function()
    vim.diagnostic.jump({
        count = -1,
        float = true,
        severity = vim.diagnostic.severity.ERROR,
    })
end)

require('mason').setup({})
