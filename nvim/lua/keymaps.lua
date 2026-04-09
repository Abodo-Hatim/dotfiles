local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "

-- Save file
map("n", "<leader>w", ":w<CR>", { desc = "Save" })

-- Quit
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Navigate windows
map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
map("n", "<C-l>", "<C-w>l", { desc = "Move right" })
map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
