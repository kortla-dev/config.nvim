local M = {
  "brenoprata10/nvim-highlight-colors",
  keys = {
    { "<leader>ht", "<Cmd>HighlightColors Toggle<CR>", desc = "Toggle colour highlighting" },
  },
}

M.config = function()
  local highlight = require("nvim-highlight-colors")

  highlight.setup({})
  highlight.turnOff()
end

return M
