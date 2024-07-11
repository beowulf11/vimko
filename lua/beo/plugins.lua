return {
    "tpope/vim-fugitive",
    -- "nvim-treesitter/playground",
    -- "theprimeagen/harpoon",
    -- "theprimeagen/refactoring.nvim",
    "mbbill/undotree",
    "nvim-treesitter/nvim-treesitter-context",
    "eandrju/cellular-automaton.nvim",
    "nvim-lua/plenary.nvim",
    "airblade/vim-gitgutter", -- Git gutter
    "kevinhwang91/nvim-bqf",  -- Better quickfix

    -- Color schemes
    { "rose-pine/neovim",      name = "rose-pine", },
    { "catppuccin/nvim",       name = "catppuccin", priority = 1000 },
    { "rebelot/kanagawa.nvim", name = "kanagawa" },
    -- END

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                version = "^1.0.0",
            }

        },
        tag = "0.1.6",
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup {
                icons = true,
            }
        end,
        opts = {},

    },

    {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    },

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "L3MON4D3/LuaSnip" },
        }
    },

    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },


    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
    },
    {
        'stevearc/conform.nvim',
        opts = {},
    },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },
    {
        'stevearc/aerial.nvim',
        opts = {},
        config = function()
            require("aerial").setup({})
            vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
        end,
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'goolord/alpha-nvim', -- Dashboard
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    {
        "FabijanZulj/blame.nvim",
        config = function()
            require("blame").setup()
        end
    },
    {
        'nmac427/guess-indent.nvim',
        config = function()
            require('guess-indent').setup {}
        end
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = { enabled = false },
                char = { enabled = false }
            }
        },
        keys = {
            { "<C-f>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            -- { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            -- { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            -- { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            -- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    {
        "supermaven-inc/supermaven-nvim",
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "echasnovski/mini.icons" },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
}
