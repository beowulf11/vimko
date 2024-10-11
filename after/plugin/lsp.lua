vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }

local lspkind = require("lspkind")
lspkind.init()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)

    vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        htmx = function()
            require('lspconfig').htmx.setup({})
        end
        -- pyright = function()
        --     print(lsp_zero)
        --     local pyright_opts = lsp_zero.nvim_pyright({
        --         settings = {
        --             pyright = { autoImportCompletion = true, },
        --             python = { analysis = { autoSearchPaths = true, diagnosticMode = 'openFilesOnly', useLibraryCodeForTypes = true, typeCheckingMode = 'off' } }
        --         }
        --     })
        --     print(pyright_opts)
        --     require('lspconfig').pyright.setup(pyright_opts)
        -- end,
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        -- { name = 'nvim_lua' },
        { name = 'luasnip',   keyword_length = 2 },
        { name = 'path' },
        { name = 'buffer',    keyword_length = 3 },
        -- { name = "copilot" }, -- , group_index = 1 }, -- Only show when no LSP results
        { name = "supermaven" },
    },
    formatting = lsp_zero.cmp_format({ details = false }),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true
            },
            { "i", "c" }
        ),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})

local ls = require("luasnip")
require("luasnip.loaders.from_lua").lazy_load()
ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
})

-- Load custom snippets
for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
    loadfile(ft_path)()
end

-- Snippet keybindings
vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })
