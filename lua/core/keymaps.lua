vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opts = { noremap = true, silent = true }

opts.desc = "Moves line(s) in visual selection up"
vmap("K", ":m '<-2<CR>gv=gv", opts)

opts.desc = "Moves line(s) in visual selection down"
vmap("J", ":m '>+1<CR>gv=gv", opts)

opts.desc = "Move down in buffer with cursor centered"
nmap("<C-d>", "<C-d>zz", opts)

opts.desc = "Move up in buffer with cursor centered"
nmap("<C-u>", "<C-u>zz", opts)

nmap("n", "nzzzv", opts)
nmap("N", "Nzzzv", opts)

vmap("<", "<gv", opts)
vmap(">", ">gv", opts)

opts.desc = "Paste without replacing clipboard content"
vim.keymap.set("x", "<leader>p", [["_dP]], opts)
vmap("p", '"_dp', opts)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Window splitting
opts.desc = "Split window vertically"
nmap("<leader>sv", "<C-w>v", opts)

opts.desc = "Split window horizontally"
nmap("<leader>sh", "<C-w>s", opts)

opts.desc = "Make splits equal size"
nmap("<leader>se", "<C-w>=", opts)

opts.desc = "Close current split"
nmap("<leader>sx", "<CMD>close<CR>", opts)

-- MISC

imap("<C-f>", "<Esc>", opts)

opts.desc = "Clear search hl"
nmap("<leader>nh", ":nohl<CR>", opts)

opts.desc = "Repeat last macro"
nmap("m", "@@", opts)

opts.desc = "Flush undofile for current buffer"
nmap("<leader>fu", function()
  vim.fn.delete(vim.fn.undofile(vim.fn.expand("%")))
end, opts)

nmap("<C-s>", "<CMD>w<CR>")

-- -- window nav
-- nmap("<C-k>", "<C-w>k")
-- nmap("<C-j>", "<C-w>j")
-- nmap("<C-h>", "<C-w>h")
-- nmap("<C-l>", "<C-w>l")
