return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  priority = 1000, -- Makes sure this is loaded first
  config = function()
    require("gruvbox").setup({
      bold = false,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      overrides = {
        ["@constant.builtin"] = { fg = "#7DAEA3" },
        ["@constructor"] = { fg = "#FF964F" },
        ["@function"] = { fg = "#C1C428" },
        ["@function.builtin"] = { fg = "#FF964F" },
        ["@function.call"] = { fg = "#C1C428" },
        ["@keyword"] = { fg = "#FF6961" },
        ["@keyword.conditional"] = { fg = "#fabd2f" },
        ["@keyword.function"] = { fg = "#FF6961" },
        ["@keyword.modifier"] = { fg = "#FF6961" },
        ["@keyword.operator"] = { fg = "#FF6961" },
        ["@keyword.repeat"] = { fg = "#FF6961" },
        ["@keyword.return"] = { fg = "#FF6961" },
        ["@label"] = { fg = "#fabd2f" },
        ["@module"] = { fg = "#ecd0a0" },
        ["@operator"] = { fg = "#FF964F" },
        ["@punctuation.bracket"] = { fg = "#A89984" },
        ["@punctuation.delimiter"] = { fg = "#FF964F" },
        ["@punctuation.special"] = { fg = "#FF964F" },
        ["@type"] = { fg = "#A2BFFE" },
        ["@variable"] = { fg = "#ecd0a0" }, -- #ebdbb2
        ["@variable.builtin"] = { fg = "#A89984" },
        ["@variable.parameter"] = { fg = "#83a598" },
      },
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}
