local wordsConfig = {
    enabled = true,            -- enable/disable the plugin
    debounce = 200,            -- time in ms to wait before updating
    notify_jump = false,       -- show a notification when jumping
    notify_end = true,         -- show a notification when reaching the end
    foldopen = true,           -- open folds after jumping
    jumplist = true,           -- set jump point before jumping
    modes = { "n", "i", "c" }, -- modes to show references
}

local dashboardConfig = {
    sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
                return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
        },
        { section = "startup" },
    },
}

local lazygitConfig = {
    -- automatically configure lazygit to use the current colorscheme
    -- and integrate edit with the current neovim instance
    configure = true,
    -- extra configuration for lazygit that will be merged with the default
    -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
    -- you need to double quote it: `"\"test\""`
    config = {
        os = { editPreset = "nvim-remote" },
        gui = {
            -- set to an empty string "" to disable icons
            nerdFontsVersion = "3",
        },
    },
    theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
    -- Theme for lazygit
    theme = {
        [241]                      = { fg = "Special" },
        activeBorderColor          = { fg = "MatchParen", bold = true },
        cherryPickedCommitBgColor  = { fg = "Identifier" },
        cherryPickedCommitFgColor  = { fg = "Function" },
        defaultFgColor             = { fg = "Normal" },
        inactiveBorderColor        = { fg = "FloatBorder" },
        optionsTextColor           = { fg = "Function" },
        searchingActiveBorderColor = { fg = "MatchParen", bold = true },
        selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
        unstagedChangesColor       = { fg = "DiagnosticError" },
    },
    win = {
        style = "lazygit",
    },
}

return {
    {
        "folke/todo-comments.nvim",
        enabled = true,
        -- Also has :TodoTelescope to load todo/warn/... into telescope
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    -- {
    --     'goolord/alpha-nvim', -- Dashboard
    --     dependencies = { 'nvim-tree/nvim-web-devicons' },
    --     config = function()
    --         require 'alpha'.setup(require 'alpha.themes.startify'.config)
    --     end
    -- },
    {
        "folke/snacks.nvim",
        enabled = true,
        priority = 1000,
        lazy = false,
        keys = {
            { "<leader>.", function() Snacks.scratch() end,        desc = "Toggle Scratch Buffer" },
            { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = false },
            dashboard = dashboardConfig,
            -- scratch = scratchConfig,
            lazygit = lazygitConfig,
            notify = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = false },
            statuscolumn = { enabled = false },
            words = wordsConfig,
            terminal = { enabled = false },
        },
    },

    {
        'echasnovski/mini.nvim',
        enabled = true,
        version = false,
        config = function()
            -- require('mini.trailspace').setup() -- TODO: MiniTrailspace.trim() to trimp all trailing whitespace, figure out how to disable on dashboard
            require('mini.notify').setup() -- Nice notifications (wrapper for vim.notify())
            -- require('mini.cursorword').setup() -- Highlights the word under the cursor
            require('mini.diff').setup({
                view = {
                    -- Visualization style. Possible values are 'sign' and 'number'.
                    -- Default: 'number' if line numbers are enabled, 'sign' otherwise.
                    style = vim.go.number and 'number' or 'sign',

                    -- Signs used for hunks with 'sign' view
                    signs = { add = '▒', change = '▒', delete = '▒' },

                    -- Priority of used visualization extmarks
                    priority = 199,
                },
                mappings = {
                    -- Apply hunks inside a visual/operator region
                    apply = '<leader>hs',

                    -- Reset hunks inside a visual/operator region
                    reset = '<leader>hu',

                    -- Hunk range textobject to be used inside operator
                    -- Works also in Visual mode if mapping differs from apply and reset
                    textobject = 'gh',

                    -- Go to hunk range in corresponding direction
                    goto_first = '[C',
                    goto_prev = '[c',
                    goto_next = ']c',
                    goto_last = ']C',
                },

            })

            local gen_loader = require('mini.snippets').gen_loader
            require('mini.snippets').setup({
                -- Array of snippets and loaders (see |MiniSnippets.config| for details).
                -- Nothing is defined by default. Add manually to have snippets to match.
                snippets = {
                    gen_loader.from_lang(),
                },

                -- Module mappings. Use `''` (empty string) to disable one.
                mappings = {
                    -- Expand snippet at cursor position. Created globally in Insert mode.
                    expand = '<C-j>',

                    -- Interact with default `expand.insert` session.
                    -- Created for the duration of active session(s)
                    jump_next = '<C-l>',
                    jump_prev = '<C-h>',
                    stop = '<C-c>',
                },

                -- Functions describing snippet expansion. If `nil`, default values
                -- are `MiniSnippets.default_<field>()`.
                expand = {
                    -- Resolve raw config snippets at context
                    prepare = nil,
                    -- Match resolved snippets at cursor position
                    match = nil,
                    -- Possibly choose among matched snippets
                    select = nil,
                    -- Insert selected snippet
                    insert = nil,
                },
            })
            vim.keymap.set("n", "<leader>hp", "<cmd>lua MiniDiff.toggle_overlay()<CR>",
                { desc = "Toggle git diff overlay" })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        enabled = true,
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "tsx", "sql", "javascript", "bash", "python" },
                -- indent = { enable = true }, -- Using UFO for folding
                highlight = { enable = true, },
                incremental_selection = { enable = true, },
                matchup = {
                    enable = true,             -- mandatory, false will disable the whole extension
                    disable = { "c", "ruby" }, -- optional, list of language that will be disabled
                },
                injection = {
                    enable = true,
                    -- You could potentially disable default injections if they conflict,
                    -- but usually enabling is enough.
                    -- disable = { "javascript" }, -- Use cautiously if needed
                },
            }
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    -- Defaults
                    enable_close = true,         -- Auto close tags
                    enable_rename = true,        -- Auto rename pairs of tags
                    enable_close_on_slash = true -- Auto close on trailing </
                },
                -- Also override individual filetype configs, these take priority.
                -- Empty by default, useful if one of the "opts" global settings
                -- doesn't work well in a specific filetype
                per_filetype = {
                    ["html"] = {
                        enable_close = false
                    }
                }
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = true,
        setup = function()
            require("treesitter-context").setup {
                enable = true,           -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 2,           -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0,   -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 1, -- Maximum number of lines to show for a single context
                trim_scope = 'outer',    -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'topline',        -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20,     -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }
        end,
        config = function()
            vim.keymap.set('n', '[t', function()
                require('treesitter-context').go_to_context(vim.v.count1)
            end, { silent = true, desc = 'Go to previous context' })
        end,
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
        "kevinhwang91/nvim-bqf", -- Better quickfix
    },
    {
        'stevearc/oil.nvim',
        opts = {
            delete_to_trash = true,
        },
        dependencies = { "echasnovski/mini.icons" },
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function()
            vim.opt.termguicolors = true
            require("colorizer").setup({
                filetypes = {
                    "css",
                    "javascript",
                    html = { mode = "foreground" },
                },
                user_default_options = {
                    css = true,
                    css_fn = true,     -- Enable parsing functions like oklch(...)
                    tailwind = "both", -- Enable tailwind colors
                    mode = "virtualtext",
                    virtualtext = "■",
                }
            })
        end
    },
}
