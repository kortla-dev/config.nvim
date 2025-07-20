local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves line(s) in visual selection up" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves line(s) in visual selection down" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with cursor centered" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer with cursor centered" })

keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without replacing clipboard content" })
keymap.set("v", "p", '"_dp', opts)
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("i", "<C-f>", "<Esc>")
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- Window splitting
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<CMD>close<CR>", { desc = "Close current split" })

