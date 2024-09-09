local M = {
  "mfussenegger/nvim-jdtls",
}

-- M.config = function()
--   local cfg = {
--     cmd = { vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin", "jdtls") },
--     -- root_dir = vim.fs.dirname(vim.fs.find({ ".git", ".idea" }, { upward = true })[1]),
--     root_dir = require("lspconfig.server_configurations.jdtls").default_config.root_dir,
--   }
--
--   require("jdtls").start_or_attach(cfg)
-- end

return M
