local M = {
  "numToStr/Comment.nvim",
  event = { "BufNewFile", "BufReadPre" },
}

M.opts = {
  padding = true,
  stikcy = true,
  mappings = {
    basic = true,
  },
}

return M
