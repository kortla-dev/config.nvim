local M = {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false, -- This plugin is already lazy
}

-- M.config = function()
--   local mason_registry = require("mason-registry")
--
--   local codelldb = mason_registry.get_package("codelldb")
--   local extension_path = vim.fs.joinpath(codelldb:get_install_path(), "extenxion")
--   local codelldb_path = vim.fs.joinpath(extension_path, "adapter", "codelldb")
--   local liblldb_path = vim.fs.joinpath(extension_path, "lldb", "lib", "liblldb.dylib")
--
--   local cfg = require("rustaceanvim.config")
--
--   vim.g.rustaceanvim = {
--     dap = {
--       adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
--     },
--   }
-- end

return M
