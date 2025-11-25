local M = {
  "chrisgrieser/nvim-lsp-endhints",
  enabled = true,
  event = "LspAttach",
  opts = {
    label = {
      truncateAtChars = 50,
    },
  },
}

return M
