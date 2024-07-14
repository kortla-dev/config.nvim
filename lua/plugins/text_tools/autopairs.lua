return {
    'windwp/nvim-autopairs',
    event = {
      "InsertEnter", -- before entering insert mode
    },

    -- TODO: nvim-cmp coupling
    config = function()
      local autopairs = require("nvim-autopairs")

      -- configure autoparis
      autopairs.setup({
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = {"string"}, -- dont add pairs in lua string treesitter nodes
        },
      })

      -- import nvim-autopairs completion functionality
      -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- import nvim-cmp plugin (completion plugin)
      -- local cmp = require("cmp")

      -- make autopairs and completion work together
      -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
}
