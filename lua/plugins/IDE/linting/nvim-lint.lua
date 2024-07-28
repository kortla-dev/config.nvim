local M = {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
}

M.config = function()
  local nvim_lint = require("lint")

  nvim_lint.linters_by_ft = {
    python = { "pylint" },
  }

  vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
    group = vim.api.nvim_create_augroup("Lint", { clear = true }),
    pattern = { "*.py" },
    callback = function()
      nvim_lint.try_lint()
    end,
  })
end

return M
