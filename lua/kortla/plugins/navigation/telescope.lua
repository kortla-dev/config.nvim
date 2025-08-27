local M = {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
}

M.config = function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.load_extension("fzf")

  telescope.setup({
    defaults = {
      prompt_prefix = " :~$ ", -- TODO: find something better
      sorting_strategy = "ascending",
      path_display = { "truncate" },
      initial_mode = "insert",
      selection_strategy = "reset",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.8,
        preview_cutoff = 120,
      },
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-f>"] = actions.close,
        },
      },
    },
  })

  local keymap = vim.keymap

  keymap.set("n", "<leader>f", "", { desc = "Telescope bindings" })
  keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
  keymap.set("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
  keymap.set("n", "<leader>fs", "<Cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
  keymap.set("n", "<leader>fc", "<Cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
end

return M
