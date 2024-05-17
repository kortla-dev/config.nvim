return {
  "numToStr/Comment.nvim",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring"
  },
  eveiint = {"BufReadPre", "BufNewFile"},

  config = function()
    local comment = require("Comment")
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook()
    })
  end
}

-- gcc: comment current line
-- gc[motion]: gc2j will comment the current line and the two following lines
