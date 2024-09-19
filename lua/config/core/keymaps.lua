vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<Cmd>close<CR>", { desc = "Close current split" })

-- buffer management
keymap.set("n", "<leader>tn", "<Cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<Cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tl", "<Cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>th", "<Cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<Cmd>tabnew %<CR>", { desc = "Open current buffer in a new tab" })

-- NOTE: local map leader is also ','
-- macro repeat
keymap.set("n", ",", "@@", { desc = "Repeat the last executed macro" })

-- Set terminal mode
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

local os_type = vim.loop.os_uname().sysname

if os_type == "Windows_NT" then
  keymap.set("n", "<leader>tt", "<cmd>terminal powershell<cr>")
else
  keymap.set("n", "<leader>tt", "<cmd>terminal zsh<cr>")
end
