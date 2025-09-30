require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "J", ":m '>+1<CR>gv=v", { desc = "Move down highlighted text" })
map("v", "K", ":m '>-2<CR>gv=v", { desc = "Move up highlighted text" })
map("n", "<C-k>", "<C-u>zz", { desc = "Half page up" })
map("n", "<C-j>", "<C-d>zz", { desc = "Half page down" })
map("n", "n", "nzzzv", { desc = "Hold search word in the middle forwards" })
map("n", "N", "Nzzzv", { desc = "Hold search word in the middle backwards" })

map("x", "<leader>p", '"_dP', { desc = "Paste without removing buffer" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "N", "Nzzzv", { desc = "Hold search word in the middle backwards" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
