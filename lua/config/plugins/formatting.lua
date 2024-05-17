return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        rust = { "rustfmt" },
        cs = { "csharpier" },
        python = { "isort", "black" },
        lua = { "stylua" },
        javascript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
      },

      format_on_save = {
        lsp_fallbacks = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    -- set keymaps
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallbacks = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
