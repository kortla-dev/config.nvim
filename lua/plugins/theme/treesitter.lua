local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
}

M.config = function()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    ensure_installed = {
      "lua",
      "html",
      "css",
      "javascript",
      "python",
      "rust",
      "vimdoc",
      "c_sharp",
    },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
