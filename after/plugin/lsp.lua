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

require('mason').setup({})
