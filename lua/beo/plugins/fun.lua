return {
    {
        "eandrju/cellular-automaton.nvim",
        enabled = false,
        config = function()
            vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton game_of_life<CR>", { desc = "Game of Life" })
        end
    },
}
