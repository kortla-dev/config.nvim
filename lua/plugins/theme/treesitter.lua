---@diagnostic disable: missing-fields
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({
      -- enable better syntax highlighting
      highlight = {
        enable = true,
      },

      -- enable better indentation
      indent = {
        enable = true,
      },

      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },

      -- ensure these language parsers are installed
      ensure_installed = {
        "rust",
        "python",
        "lua",
        "html",
        "css",
        "javascript",
        "json",
        "vimdoc",
        "latex",
        "toml",
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
