local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
}

M.config = function()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    ensure_installed = { "lua", "python", "rust", "vimdoc" },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
