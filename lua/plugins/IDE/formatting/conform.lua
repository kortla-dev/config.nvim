local M = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

M.opts = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
  },
  format_on_save = {
    lsp_format = "fallback",
    async = false,
    timeout_ms = 1000,
  },
}

return M
