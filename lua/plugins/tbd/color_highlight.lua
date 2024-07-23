return {
  "brenoprata10/nvim-highlight-colors",
  keys = {
    { "<leader>ht", "<Cmd>HighlightColors Toggle<CR>", desc = "Toggle colour highlighting" },
  },

  config = function()
    local highlight = require("nvim-highlight-colors")

    highlight.setup({})
    highlight.turnOff()
  end,
}
