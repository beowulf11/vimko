-- vim.cmd.colorscheme "catppuccin-mocha"
local colorscheme = "kanagawa" -- or "tokyonight", etc.
local is_installed = require("lazy.core.config").plugins[colorscheme] ~= nil
if is_installed then
    vim.cmd.colorscheme(colorscheme)
end
