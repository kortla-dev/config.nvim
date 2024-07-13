return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local nvim_lint = require("lint")

    nvim_lint.linters_by_ft = {
      python = { "pylint" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      pattern = { "*.py" },
      callback = function()
        nvim_lint.try_lint()
      end,
    })
  end,
}
