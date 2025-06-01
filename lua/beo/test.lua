return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        enabled = true,
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "tsx", "javascript", "sql", "javascript", "bash", "python" },

                -- indent = { enable = true }, -- Using UFO for folding
                highlight = { enable = true, },
                incremental_selection = { enable = true, },
            }
        end,
    },
}
