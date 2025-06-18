return {
    {
        "rushjs1/nuxt-goto.nvim",
        ft = "vue",
    },
    {
        "karloskar/poetry-nvim",
        config = function()
            require("poetry-nvim").setup()
        end
    },
    {
        "saghen/blink.cmp",
        dependencies = {
            { "echasnovski/mini.icons" },
            { 'echasnovski/mini.snippets' },
        },
        version = '*',
        enabled = true,
        ---@type blink.cmp.Config
        opts = {
            snippets = { preset = 'mini_snippets' },
            keymap = {
                preset = 'default',
            },
            fuzzy = {
                implementation = 'prefer_rust_with_warning',
                prebuilt_binaries = {
                    download = true,
                }
            },
            appearance = {
                highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
            },
            signature = { enabled = true },
            completion = {
                ghost_text = { enabled = true },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
                menu = {
                    draw = {
                        treesitter = { 'lsp' },
                    }
                }
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'buffer', 'snippets' },
            },
        },
        opts_extend = { "sources.default" }
    },
    {
        "neovim/nvim-lspconfig"
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
    },
}
