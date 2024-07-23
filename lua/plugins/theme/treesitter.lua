return {
  "nvim-treesitter/nvim-treesitter",
  event = {"BufReadPre", "BufNewFile"},
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      ensure_installed = { "lua", "rust", "vimdoc" },
      highlight = { enable = true },
      indent = { enable = true },
    })

  end
}
