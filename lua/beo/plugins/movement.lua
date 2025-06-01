return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = { enabled = false },
                char = { enabled = false }
            },
            jump = {
                autojump = true,
            },
            label = {
                rainbow = {
                    enabled = true,
                }
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
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                {
                    "nvim-telescope/telescope-live-grep-args.nvim",
                    version = "^1.0.0",
                }
            },
            {
                'nvim-telescope/telescope-ui-select.nvim'
            }
        }
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
    },
    { "andymass/vim-matchup" },
    {
        'mawkler/refjump.nvim',
        lazy = false,
        keys = { ']r', '[r' }, -- Uncomment to lazy load
        opts = {}
    }
}
