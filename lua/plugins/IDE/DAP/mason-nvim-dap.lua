local M = {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  event = { "VeryLazy" },

  opts = {
    handlers = {},
    automatic_setup = true,
  },
}

return M
