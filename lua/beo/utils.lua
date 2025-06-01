local M = {}

function M.plugin_exists(name)
    local config = require("lazy.core.config")
    return config.plugins[name]
end

return M
