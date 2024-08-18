local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "onsails/lspkind.nvim",
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    "saadparwaiz1/cmp_luasnip", -- for LuaSnip autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
  },
  event = { "InsertEnter" },
}

M.config = function()
  local nvim_cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")

  -- keymaps
  local keymaps = {
    ["<C-p>"] = nvim_cmp.mapping.select_prev_item(), --previous suggestion
    ["<C-n>"] = nvim_cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = nvim_cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = nvim_cmp.mapping.scroll_docs(4),
    ["<C-o>"] = nvim_cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = nvim_cmp.mapping.abort(), -- close completion window
    ["<C-y>"] = nvim_cmp.mapping.confirm({ select = true }),
  }

  -- loads vscode style snippets from installed plugins (eg. friendly-snippets)
  require("luasnip.loaders.from_vscode").lazy_load()

  -- autocompletion for in files
  nvim_cmp.setup({

    -- sources for autocompletion
    sources = nvim_cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer" },
      { name = "luasnip" },
    }),

    window = {
      completion = {
        col_offset = -3,
        side_padding = 0,
      },
      documentation = false,
    },

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = lspkind.cmp_format({
          maxwidth = 50,
          mode = "symbol",
          menu = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
          },
        })(entry, vim_item)

        -- if needed can be " " .. (kind.kind or "") .. " "
        kind.kind = " " .. kind.kind .. " "

        return kind
      end,
    },

    view = {
      entries = {
        name = "custom", -- can be "custom", "wildmenu" or "native"
        selection_order = "top_down",
      },
    },

    completion = {
      -- https://neovim.io/doc/user/options.html#'completeopt'
      completeopt = "menu,menuone,noinsert",
    },

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    mapping = nvim_cmp.mapping(keymaps, { "i" }),
  })
end

return M
