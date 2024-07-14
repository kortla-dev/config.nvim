vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap

-- clears highlighting
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<Cmd>close<CR>", { desc = "Close current split" })

-- buffer management
keymap.set("n", "<leader>to", "<Cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<Cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<Cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<Cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<Cmd>tabnew %<CR>", { desc = "Open current buffer in a new tab" })
