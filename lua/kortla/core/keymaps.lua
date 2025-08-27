vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

opts.desc = "Moves line(s) in visual selection up"
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

opts.desc = "Moves line(s) in visual selection down"
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)

opts.desc = "Move down in buffer with cursor centered"
keymap.set("n", "<C-d>", "<C-d>zz", opts)

opts.desc = "Move up in buffer with cursor centered"
keymap.set("n", "<C-u>", "<C-u>zz", opts)

keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

opts.desc = "Paste without replacing clipboard content"
keymap.set("x", "<leader>p", [["_dP]], opts)
keymap.set("v", "p", '"_dp', opts)
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Window splitting
opts.desc = "Split window vertically"
keymap.set("n", "<leader>sv", "<C-w>v", opts)

opts.desc = "Split window horizontally"
keymap.set("n", "<leader>sh", "<C-w>s", opts)

opts.desc = "Make splits equal size"
keymap.set("n", "<leader>se", "<C-w>=", opts)

opts.desc = "Close current split"
keymap.set("n", "<leader>sx", "<CMD>close<CR>", opts)

-- MISC

keymap.set("i", "<C-f>", "<Esc>", opts)

opts.desc = "Clear search hl"
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)

opts.desc = "Repeat last macro"
keymap.set("n", ",", "@@", opts)

opts.desc = "Flush undofile for current buffer"
keymap.set("n", "<leader>fu", function()
  vim.fn.delete(vim.fn.undofile(vim.fn.expand("%")))
end, opts)

keymap.set("n", "<C-s>", "<CMD>w<CR>")
