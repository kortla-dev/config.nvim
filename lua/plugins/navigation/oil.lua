local M = {
  "stevearc/oil.nvim",
  dependencies = {
    -- { "echasnovski/mini.icons", opts = {} },
    "nvim-tree/nvim-web-devicons",
  },
}

M.config = function()
  require("oil").setup({
    default_file_explorer = true,
  })

  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

return M
