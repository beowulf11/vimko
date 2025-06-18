vim.opt.completeopt = { "menu", "menuone", "preview" }

-- local lspkind = require("lspkind")
-- lspkind.init()

vim.lsp.enable({
    'pyright',
    'lua_ls',
    'ts_ls', 'svelte',
    'tailwindcss',
    'prettier',
    'biome',
    'docker_compose_language_service',
    'astro',
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

local function reset_lsp()
    vim.lsp.stop_client(vim.lsp.get_clients())

    vim.defer_fn(function()
        vim.cmd('edit')
    end, 100)
end

vim.api.nvim_create_user_command("LR", function()
    reset_lsp()
end, {})
