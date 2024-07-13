return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- helps install language servers used by mason.nvim
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- helps install formatters and linters
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "rust_analyzer", -- rust
        "omnisharp", -- c#
        "pyright", -- python
        "lua_ls", -- lua
        "html", -- html
        "cssls", -- css
        "tsserver", -- javascript and typescript
        "texlab",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- Formatters
        "csharpier", -- c#
        "isort", -- python
        "black", -- python
        "stylua", -- lua
        "prettier", -- a lot of web stuff like js, html, css, etc.
        "latexindent", -- latex formatter
        "taplo", -- toml

        -- Linters
        "pylint", -- python
      },
    })
  end,
}
