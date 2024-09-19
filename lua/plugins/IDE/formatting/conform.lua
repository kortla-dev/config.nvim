local M = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

M.opts = {
  formatters_by_ft = {
    -- lua = { "stylua" },
    python = { "black" },
    rust = { "rustfmt" },
    cs = { "csharpier" },
    html = { "prettier" },
    css = { "prettier" },
    javascript = { "prettier" },
  },
  format_on_save = {
    lsp_format = "fallback",
    async = false,
    timeout_ms = 1500,
  },
}

return M
