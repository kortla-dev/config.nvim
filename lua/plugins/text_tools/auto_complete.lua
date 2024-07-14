return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-cmdline", -- source for vim's cmdline
    "onsails/lspkind.nvim", -- vscode like pictograms
  },

  event = {
    "InsertEnter", -- before entering insert mode
    "CmdlineEnter", -- before enterning command mode
  },

  config = function()
    local nvim_cmp = require("cmp")
    local lspkind = require("lspkind")

    -- keymaps
    local keymaps = {
      ["<C-k>"] = nvim_cmp.mapping.select_prev_item(), --previous suggestion
      ["<C-j>"] = nvim_cmp.mapping.select_next_item(), -- next suggestion
      ["<C-b>"] = nvim_cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = nvim_cmp.mapping.scroll_docs(4),
      ["<C-o>"] = nvim_cmp.mapping.complete(), -- show completion suggestions
      ["<C-e>"] = nvim_cmp.mapping.abort(), -- close completion window
      ["<CR>"] = nvim_cmp.mapping.confirm({select = true}),
    }

    -- autocompletion for in files
    nvim_cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },

      mapping = nvim_cmp.mapping(keymaps, {"i", "c"}),

      -- sources for autocompletion
      sources = nvim_cmp.config.sources({
        {name = "nvim_lsp"},
        {name = "buffer"},
        {name = "path"},
      }),

      -- configure lspkind for vscode like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })

    -- `/` cmdline setup.
    nvim_cmp.setup.cmdline('/', {
      mapping = nvim_cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
  end
}
