local opts = { noremap = true, silent = true }

return {
  "christoomey/vim-tmux-navigator",
  keys = {
    { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", opts },
    { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", opts },
    { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", opts },
    { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", opts },
  },
}
