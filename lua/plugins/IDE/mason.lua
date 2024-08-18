local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
}

M.config = function()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local mason_tool_installer = require("mason-tool-installer")

  mason.setup({
    PATH = "prepend",
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  mason_lspconfig.setup({
    ensure_installed = {
      "lua_ls", -- lua
      "pyright", -- python
      "html",
    },
  })

  mason_tool_installer.setup({
    ensure_installed = {
      -- Formatters
      "stylua", -- lua
      "black", -- python
      "csharpier", -- c#
      "prettier", -- web stuff

      -- Linters
      "pylint", -- python
    },
  })
end

return M
