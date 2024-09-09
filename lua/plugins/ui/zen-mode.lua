local M = {
  "folke/zen-mode.nvim",
}

M.keys = {
  { "<leader>zm", "<cmd>ZenMode<cr>", mode = "n", desc = "Toggle zen mode" },
}

M.opts = {
  alacritty = { enabled = true },
}

return M
