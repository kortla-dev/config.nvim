local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "BufReadPre", "BufNewFile" },
}

M.config = function()
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)

      -- Disables semantic token syntax highlighting
      client.server_capabilities.semanticTokensProvider = nil

      -- Buffer local mappings
      -- See ':help vim.lsp.*' for documentation on any of the below functions
      local opts = { buffer = ev.buf, silent = true }

      -- set keymaps
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" }) -- go to declaration
      vim.keymap.set("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definition" }) -- show lsp definition
      vim.keymap.set("n", "gt", "<Cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" }) -- show lsp type definitions
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" }) -- see available code actions
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" }) -- smart rename
      vim.keymap.set("n", "<leader>D", "<Cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" }) -- show diagnostics
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" }) -- show diagnostics for line
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostics" }) -- jump to previous diagnostic in buffer
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" }) -- jump to next diagnostic in buffer
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" }) -- show documentation for what is under cursor
      vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" }) -- mapping to restart lsp if necessary
    end,
  })

  -- lets LSP interact wiht nvim-cmp
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  mason_lspconfig.setup_handlers({
    -- default handler for installed servers
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
    end,

    -- we clear rust_analyzer setup to avoid conflict with rustaceanvim
    ["rust_analyzer"] = function() end,
    -- ["pyright"] = function() end,

    -- configuration for lua server
    ["lua_ls"] = function()
      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            -- make language server recognize "vim" global variable
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    end,
  })
end

return M
