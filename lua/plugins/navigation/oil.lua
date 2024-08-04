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
    view_options = {
      show_hidden = true,
      -- defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr)
        return vim.startswith(name, ".")
      end,

      -- defines what will never be shown, even when `show_hidden` is set
      is_always_hidden = function(name, bufnr)
        return vim.startswith(name, "..")
      end,
    },
  })

  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

return M
