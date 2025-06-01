return {
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree" })
        end,
    },
    "nvim-lua/plenary.nvim",
    {
        "gitpushjoe/zuzu.nvim",
        enabled = true,
        opts = {
            keymaps = {
                build = {
                    { "<leader>zu", "<leader>ZU", "<leader>zU", "<leader>Zu" },
                    { "<leader>zv", "<leader>ZV", "<leader>zV", "<leader>Zv" },
                    { "<leader>zs", "<leader>ZS", "<leader>zS", "<leader>Zs" },
                },
                reopen = {
                    "<leader>z,",
                    '<leader>z"',
                    "<leader>z:",
                },
                new_profile = "<leader>z+",
                new_project_profile = "<leader>z/",
                edit_profile = "<leader>z=",
                edit_all_applicable_profiles = "<leader>z?",
                edit_all_profiles = "<leader>z*",
                edit_hooks = "<leader>zh",

            }
        }
    },

    {
        "numToStr/Comment.nvim",
        opts = {},
        enabled = false,
        lazy = false,
    },

    {
        "kylechui/nvim-surround",
        enabled = true,
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
        enabled = true,
        dependencies = { "kevinhwang91/promise-async" },
    },
    {
        "stevearc/conform.nvim",
        enabled = true,
        opts = {},
    },
    {
        "stevearc/aerial.nvim",
        opts = {},
        enabled = true,
        config = function()
            require("aerial").setup({})
            vim.keymap.set("n", "<leader>al", "<cmd>AerialToggle<CR>")
        end,
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        'nmac427/guess-indent.nvim',
        enabled = true,
        config = function()
            require('guess-indent').setup {}
        end
    },

    {
        'akinsho/toggleterm.nvim',
        enabled = true,
        version = "*",
        config = {
            vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
        },
    },
}
