if not require("beo/utils").plugin_exists("lsp-zero.nvim") then
    return
end

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
    -- vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Add capabilities to lsp-zero
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('blink.cmp').get_lsp_capabilities()
)


-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        tsserver = function()
            local lspconfig = require("lspconfig")
            local util = require("lspconfig.util")

            lspconfig.tsserver.setup({
                on_attach = function(client, bufnr)
                    local root_dir = client.config.root_dir
                    -- Check for svelte.config.* in the root dir
                    if util.path.exists(root_dir .. "/svelte.config.js") or util.path.exists(root_dir .. "/svelte.config.ts") then
                        vim.defer_fn(function()
                            vim.lsp.buf_detach_client(bufnr, client.id)
                            vim.notify("Detached ts_ls (Svelte project detected)", vim.log.levels.INFO)
                        end, 100)
                    end
                end,
            })
        end,
        lua_ls = function()
            vim.notify("seeting up lua_ls")
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        htmx = function()
            require('lspconfig').htmx.setup({
                filetypes = { "html", "templ", "edge" },
                level = 'info'
            })
        end,
        -- html = function()
        --     require('lspconfig').html.setup({
        --         filetypes = { "html", "templ" }
        --     })
        -- end
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

-- Snippet keybindings
vim.keymap.set({ "i", "s" }, "<C-,>", function()
    if vim.snippet.active({ direction = 1 }) then
        vim.snippet.jump(1)
    else
        vim.notify('End of snippet')
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-.>", function()
    if vim.snippet.active({ direction = -1 }) then
        vim.snippet.jump(-1)
    else
        vim.notify('End of snippet')
    end
end, { silent = true })
