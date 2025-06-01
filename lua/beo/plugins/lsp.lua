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
            { 'rafamadriz/friendly-snippets' },
            { "echasnovski/mini.icons" },
            { 'saghen/blink.compat' }, -- Compatibility layer for supermaven
        },
        version = '*',
        enabled = true,
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'default',
                ['<C-k>'] = {},
            },
            appearance = {
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                use_nvim_cmp_as_default = false,
                highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
                -- nerd_font_variant = 'mono',
                kind_icons = {
                    Supermaven = "",
                },
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
                        components = {
                            kind_icon = {
                                ellipsis = false,
                                text = function(ctx)
                                    if ctx.source_id == 'supermaven' then
                                        return ""
                                    end
                                    local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                                    return kind_icon
                                end,
                                -- Optionally, you may also use the highlights from mini.icons
                                highlight = function(ctx)
                                    if ctx.source_id == 'supermaven' then
                                        return "WarningMsg"
                                    end
                                    local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                    return hl
                                end,
                            }
                        },
                        treesitter = { 'lsp' },
                    }
                }
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'supermaven' },
                providers = {
                    supermaven = {
                        name = 'supermaven',
                        module = 'blink.compat.source',
                        score_offset = 100,
                    },
                },
            },
        },
        opts_extend = { "sources.default" }

    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "onsails/lspkind-nvim" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "saghen/blink.cmp" },
        }
    },
}
