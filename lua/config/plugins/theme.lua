return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000, -- Makes sure this is loaded first
  config = function()
    require("gruvbox").setup({
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      overrides = {
        ["@constant.builtin.rust"] = { fg = "#7DAEA3" },
        ["@type.rust"] = { fg = "#569CD6" },
      },
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}

-- return {
--   "sainnhe/gruvbox-material",
--   lazy = false,
--   priority = 1000, -- Makes sure this is loaded first
--   config = function()
--     vim.g.gruvbox_material_enable_italic = false
--     vim.g.gruvbox_material_background = "medium"
--     vim.cmd.colorscheme("gruvbox-material")
--   end,
-- }
