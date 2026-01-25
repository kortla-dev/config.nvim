local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local cnl_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- capabilities = vim.tbl_deep_extend("force", capabilities, cnl_capabilities)

local LSP = "clangd"

vim.lsp.config(LSP, capabilities)
vim.lsp.config(LSP, { cmd = { "clangd", "--compile-commands-dir=." } })
vim.lsp.enable(LSP)
