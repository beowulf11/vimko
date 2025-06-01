if not require("beo/utils").plugin_exists("telescope.nvim") then
    return
end

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        },
        path_display = {
            "truncate"
        },

    },
    pickers = {
        find_files = {
            theme = "ivy",
        },
        buffers = {
            theme = "ivy",
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        }

    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")

local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions

vim.api.nvim_create_user_command(
    'Theme',
    function()
        require('telescope.builtin').colorscheme()
    end,
    {
        nargs = '?',
        desc = "Themes",
    }
)
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find File" })
vim.keymap.set('n', '<leader>fa', function() builtin.find_files { hidden = true, no_ignore = true } end,
    { desc = "Find All File (hidden and ignore hidden)" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffer" })
vim.keymap.set('n', '<leader>fh', builtin.current_buffer_fuzzy_find, { desc = "Find in buffer" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find Git File" })
vim.keymap.set('n', '<leader>fr', extensions.live_grep_args.live_grep_args, { desc = "Regex in project" })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Find Command" })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Find Help" })
vim.keymap.set('n', '<leader>vg', function()
    extensions.live_grep_args.live_grep_args({
        cwd = vim.fn.stdpath('config')
    })
end, { desc = "Regex in nvim config" })
vim.keymap.set('n', '<leader>vf', function()
    builtin.find_files({
        cwd = vim.fn.stdpath('config')
    })
end, { desc = "Find nvim config" })

vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", { desc = "Find references" })
