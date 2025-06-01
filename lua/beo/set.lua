vim.opt.guicursor = ""
vim.wo.cursorline = true

vim.opt.spell = false
vim.opt.spelllang = "en"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.python3_host_prog = os.getenv("PYTHON3_HOST_PROG")
local python3_path = os.getenv("PYTHON3_HOST_PROG")
if python3_path == nil then
    vim.g.python3_host_prog = python3_path
end
