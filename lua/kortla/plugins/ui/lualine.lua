local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.opts = {
  options = {
    theme = "auto",
  },
}

M.config = function()
  local lualine = require("lualine")
  local lazy_status = require("lazy.status")

  lualine.setup({
    sections = {
      lualine_x = {
        {
          lazy_status.updates,
          cond = lazy_status.has_updates,
          color = { fg = "#ff964f" },
        },
        { "encoding" },
        { "fileformat" },
        { "filetype" },
      },
    },
  })
end

return M
