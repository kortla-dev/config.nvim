local capabilities = vim.lsp.protocol.make_client_capabilities()
--local cnl_capabilities = require("cmp_nvim_lsp").default_capabilities()

--capabilities = vim.tbl_deep_extend("force", capabilities, cnl_capabilities)

local LSP = "lua_ls"

vim.lsp.config(LSP, capabilities)
vim.lsp.enable(LSP)
