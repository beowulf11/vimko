return {
    { -- Better git blame, not sure if it's needed
        "FabijanZulj/blame.nvim",
        config = function()
            require("blame").setup()
        end
    },
    { "tpope/vim-fugitive" },
}
