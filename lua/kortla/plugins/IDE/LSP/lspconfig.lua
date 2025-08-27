local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "BufReadPre", "BufNewFile" },
}

M.config = function()
  local telescope = require("telescope.builtin")

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

      client.server_capabilities.semanticTokensProvider = nil

      -- if vim.lsp.semantic_tokens then
      --   vim.lsp.semantic_tokens.enable(false, { bufnr = ev.buf, client_id = ev.data.client_id })
      -- end

      local function keymap(mode, lhs, rhs, desc)
        -- Buffer local mappings
        -- See ':help vim.lsp.*' for documentation on any of the below functions
        vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = ev.buf, silent = true })
      end

      -- set keymaps
      keymap("n", "<localleader>gd", telescope.lsp_definitions, "[g]oto [d]efinition")
      keymap("n", "<localleader>gt", telescope.lsp_type_definitions, "Show LSP type definitions") -- show lsp type definitions
      keymap({ "n", "v" }, "<localleader>ca", vim.lsp.buf.code_action, "See available [c]ode [a]ctions") -- see available code actions
      keymap("n", "<localleader>rn", vim.lsp.buf.rename, "[s]mart [r]ename") -- smart rename
      keymap("n", "<localleader>sd", function()
        telescope.diagnostics({ buffer = ev.buf })
      end, "[s]how buffer [d]iagnostics") -- show diagnostics
      keymap("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics") -- show diagnostics for line
      keymap("n", "<localleader>pd", vim.diagnostic.get_prev, "Go to [p]revious [d]iagnostics") -- jump to previous diagnostic in buffer
      keymap("n", "<localleader>nd", vim.diagnostic.get_next, "Go to [n]ext [d]iagnostic") -- jump to next diagnostic in buffer
      keymap("n", "<localleader>K", vim.lsp.buf.hover, "Show documentation for what is under cursor") -- show documentation for what is under cursor
      keymap("n", "<localleader>rs", ":LspRestart<CR>", "[r]estart [l]SP") -- mapping to restart lsp if necessary
    end,
  })

  -- Define sign icons for each severity
  -- local signs = {
  --   [vim.diagnostic.severity.ERROR] = " ",
  --   [vim.diagnostic.severity.WARN]  = " ",
  --   [vim.diagnostic.severity.HINT]  = "󰠠 ",
  --   [vim.diagnostic.severity.INFO]  = " ",
  -- }

  vim.diagnostic.config({
    -- signs = {
    --   text = signs, -- Enable signs in the gutter
    -- },
    virtual_text = true,
    underline = true,
    update_in_insert = false, -- Keep diagnostics active in insert mode
  })

  -- LSP servers and clients are able to communicate to each other what features they support.
  -- By default, Neovim doesn't support everything that is in the LSP specification.
  -- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
  -- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local cnl_capabilities = require("cmp_nvim_lsp").default_capabilities()

  capabilities = vim.tbl_deep_extend("force", capabilities, cnl_capabilities)

  ---@type table<string, table>
  local servers = {
    ["intelephense"] = {
      filetypes = { "php" },
      root_markers = { ".git" },
    },
    --
    ["lua_ls"] = {
      filetypes = { "lua" },
      root_markers = { ".editorconfig" },
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            library = {
              vim.fs.normalize(vim.fs.joinpath(vim.env.VIMRUNTIME, "lua")),
            },
          },
          diagnostics = {
            globals = { "vim" },
          },
          -- hint = { enable = true }, -- inlay hints
        },
      },
    },
    --
    ["stimulis_language_server"] = {
      filetypes = { "blade" },
    },
  }

  for server, cfg in pairs(servers) do
    cfg.capabilities = capabilities

    vim.lsp.config(server, cfg)
    vim.lsp.enable(server, true)
  end
end

return M
