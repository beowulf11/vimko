return {
    {
        "supermaven-inc/supermaven-nvim",
        opts = {
            keymaps = {
                accept_suggestion = "<C-l>",
                clear_suggestion = "<C-]>",
                accept_word = nil,
            },
            disable_inline_completion = false,         -- disables inline completion for use with cmp
            disable_keymaps = false,                   -- disables built in keymaps for more manual control
        }
    },
    {
        "dlants/magenta.nvim",
        lazy = false, -- you could also bind to <leader>mt
        enabled = true,
        build = "npm install --frozen-lockfile",
        opts = {
            profiles = {
                {
                    name = "claude-4",
                    provider = "anthropic",
                    model = "claude-sonnet-4-20250514",
                    apiKeyEnvVar = "ANTHROPIC_API_KEY"
                },
                {
                    name = "gpt-4o",
                    provider = "openai",
                    model = "gpt-4o",
                    apiKeyEnvVar = "OPENAI_API_KEY"
                }
            },
            -- open chat sidebar on left or right side
            sidebarPosition = "right",
            -- can be changed to "telescope" or "snacks"
            picker = "telescope",
            -- enable default keymaps shown below
            defaultKeymaps = true,
            -- keymaps for the sidebar input buffer
            sidebarKeymaps = {
                normal = {
                    ["<CR>"] = ":Magenta send<CR>",
                }
            },
            autoContext = {
                "context.md",
            },
            -- keymaps for the inline edit input buffer
            -- if keymap is set to function, it accepts a target_bufnr param
            inlineKeymaps = {
                normal = {
                    ["<CR>"] = function(target_bufnr)
                        vim.cmd("Magenta submit-inline-edit " .. target_bufnr)
                    end,
                },
            }
        },
    },
    {
        "olimorris/codecompanion.nvim",
        enabled = false,
        opts = {
            display = {
                action_palette = {
                    width = 95,
                    height = 10,
                    prompt = "Prompt ",                     -- Prompt used for interactive LLM calls
                    provider = "default",                   -- Can be "default", "telescope", or "mini_pick". If not specified, the plugin will autodetect installed providers.
                    opts = {
                        show_default_actions = true,        -- Show the default actions in the action palette?
                        show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                    },
                },
                chat = {
                    -- Options to customize the UI of the chat buffer
                    window = {
                        layout = "vertical", -- float|vertical|horizontal|buffer
                        position = 'right',  -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
                        border = "single",
                        height = 0.8,
                        width = 0.45,
                        relative = "editor",
                        full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
                        opts = {
                            breakindent = true,
                            cursorcolumn = false,
                            cursorline = false,
                            foldcolumn = "0",
                            linebreak = true,
                            list = false,
                            numberwidth = 1,
                            signcolumn = "no",
                            spell = false,
                            wrap = true,
                        },
                    },
                },
            },
        },
        config = function()
            vim.keymap.set("n", "<leader>ac", "<cmd>:CodeCompanionChat<CR>")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "yetone/avante.nvim",
        enabled = false,
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        opts = {
            -- add any opts here
            -- for example
            provider = "gemini",
            web_search_engine = {
                provider = "kagi",
            },
            behaviour = {
                enable_claude_text_editor_tool_mode = true,
            },
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "echasnovski/mini.pick",         -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "ibhagwan/fzf-lua",              -- for file_selector provider fzf
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
    {
        "aweis89/aider.nvim",
        enabled = false,
        dependencies = {
            -- required for core functionality
            "akinsho/toggleterm.nvim",

            -- for fuzzy file `/add`ing functionality ("ibhagwan/fzf-lua" supported as well)
            "nvim-telescope/telescope.nvim",

            -- Optional, but great for diff viewing and after_update_hook integration
            "sindrets/diffview.nvim",

            -- Optional but will show aider spinner whenever active
            "folke/snacks.nvim",

            -- Only if you care about using the /editor command
            "willothy/flatten.nvim",
        },
        lazy = false,
        opts = {
            -- Auto trigger diffview after Aider's file changes
            after_update_hook = function()
                require("diffview").open({ "HEAD^" })
            end,
        },
        keys = {
            {
                "<leader>as",
                "<cmd>AiderSpawn<CR>",
                desc = "Toggle Aidper (default)",
            },
            {
                "<leader>a<space>",
                "<cmd>AiderToggle<CR>",
                desc = "Toggle Aider",
            },
            {
                "<leader>af",
                "<cmd>AiderToggle float<CR>",
                desc = "Toggle Aider Float",
            },
            {
                "<leader>av",
                "<cmd>AiderToggle vertical<CR>",
                desc = "Toggle Aider Float",
            },
            {
                "<leader>al",
                "<cmd>AiderAdd<CR>",
                desc = "Add file to aider",
            },
            {
                "<leader>ad",
                "<cmd>AiderAsk<CR>",
                desc = "Ask with selection",
                mode = { "v", "n" },
            },
            {
                "<leader>am",
                desc = "Change model",
            },
            {
                "<leader>ams",
                "<cmd>AiderSend /model sonnet<CR>",
                desc = "Switch to sonnet",
            },
            {
                "<leader>amh",
                "<cmd>AiderSend /model haiku<CR>",
                desc = "Switch to haiku",
            },
            {
                "<leader>amg",
                "<cmd>AiderSend /model gemini/gemini-exp-1206<CR>",
                desc = "Switch to haiku",
            },
            {
                "<C-x>",
                "<cmd>AiderToggle<CR>",
                desc = "Toggle Aider",
                mode = { "i", "t", "n" },
            },
            -- Helpful mappings to utilize to manage aider changes
            {
                "<leader>ghh",
                "<cmd>Gitsigns change_base HEAD^<CR>",
                desc = "Gitsigns pick reversals",
            },
            {
                "<leader>dvh",
                "<cmd>DiffviewOpen HEAD^<CR>",
                desc = "Diffview HEAD^",
            },
            {
                "<leader>dvo",
                "<cmd>DiffviewOpen<CR>",
                desc = "Diffview",
            },
            {
                "<leader>dvc",
                "<cmd>DiffviewClose!<CR>",
                desc = "Diffview close",
            },
        },
    },
}
