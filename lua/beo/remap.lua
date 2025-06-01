vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up" })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to system clipboard without trailing newlines" })

-- Used to exit visual block mode while doing I, A and having the changes
vim.keymap.set("i", "<C-c>", "<Esc>l", { desc = "Escape from insert mode" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })

vim.keymap.set("n", "<leader>so", vim.cmd.so, { desc = "Source current file" })
vim.keymap.set("n", "<leader>sl", "<cmd>.source<CR>", { desc = "Source current line" })

vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor" })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })

vim.keymap.set("n", "<leader>no", vim.cmd.nohl, { desc = "Hide highlights" })
-- vim.keymap.set("n", "<leader>o", vim.cmd.only); -- Triggering too often by accident

-- Resize windows
-- vim.keymap.set("n", "=", [[<cmd>horizontal resize +5<cr>]], { desc = "make the window bigger vertically" })
-- vim.keymap.set("n", "-", [[<cmd>horizontal resize -5<cr>]], { desc = "make the window smaller vertically" }) -- I use this for Oil
vim.keymap.set("n", "+", [[<cmd>vertical resize +2<cr>]], { desc = "make the window bigger horizontally by pressing shift and" })
vim.keymap.set("n", "_", [[<cmd>vertical resize -2<cr>]], { desc = "make the window smaller horizontally by pressing shift and" })

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Jump to next line" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Jump to previous line" })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Jump to next quickfix" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Jump to previous quickfix" })

vim.keymap.set("n", "<C-w>t", "<cmd>tabnew<CR>", { desc = "Open new tab" })

vim.keymap.set("i", "<C-j>", "[");
vim.keymap.set("i", "<C-k>", "]");
vim.keymap.set("i", "<C-h>", "{");
vim.keymap.set("i", "<C-l>", "}");

-- LSP
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
-- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
