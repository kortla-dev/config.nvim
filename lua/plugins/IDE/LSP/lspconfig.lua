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
      opts.desc = "Go to declaration"
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definition"
      vim.keymap.set("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definition

      opts.desc = "Show LSP type definitions"
      vim.keymap.set("n", "gt", "<Cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions

      opts.desc = "Smart rename"
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      vim.keymap.set("n", "<leader>D", "<Cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show diagnostics

      opts.desc = "Show line diagnostics"
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostics"
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end,
  })

  -- vim.api.nvim_create_autocmd("BufLeave", {
  --   group = vim.api.nvim_create_augroup("LspConfigBufLeaveCleanUp", {}),
  --   callback = function(args)
  --     if args.data == nil then
  --       return
  --     end
  --
  --     local client = vim.api.get_client_by_id(args.data.client_id)
  --
  --     if client == nil then
  --       print("client is nil")
  --       return
  --     end
  --
  --     vim.lsp.buf_detach_client(args.buf, client.id)
  --   end,
  -- })

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
