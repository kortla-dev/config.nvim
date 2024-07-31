local M = {
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
}

M.opts = {
  disabled_filetypes = { "netrw", "lazy", "mason", "oil" },
}

return M
