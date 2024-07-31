local M = {
  "kortla-dev/pastelbox.nvim",
  dependencies = {
    "rktjmp/lush.nvim",
  },
  lazy = false,
  priority = 1000,
}

M.config = function()
  vim.cmd.colorscheme("pastelbox")
end

return M
