return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
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
        pickers = {
          find_files = {
            prompt_prefix = "~>  ",
          },
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<esc>"] = actions.close,
          }
        }
      }
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")

    local fg0 = "#ecd0a0"
    local bg0 = "#353535"
    local bg1 = "#504945"

    local TelescopePrompt = {
      TelescopeNormal = { bg = bg0 },
      TelescopeBorder = { bg = bg1 },

      TelescopePromptNormal = { bg = bg1 },
      TelescopePromptBorder = { fg = bg1, bg = bg1 },
      TelescopePromptTitle = { fg = fg0, bg = bg1 },

      TelescopeResultsNormal = { bg = bg0 },
      TelescopeResultsBorder = { fg = bg0, bg = bg0 },
      TelescopeResultsTitle = { fg = fg0, bg = bg0 },

      TelescopePreviewNormal = { bg = bg0 },
      TelescopePreviewBorder = { fg = bg0, bg = bg0 },
      TelescopePreviewTitle = { fg = fg0, bg = bg0 },

    }

    for hl, col in pairs(TelescopePrompt) do
      vim.api.nvim_set_hl(0, hl, col)
    end

    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<Cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<Cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<Cmd>TodoTelescope<CR>", { desc = "Find todos" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<CR>", { desc = "Opens file browser" })
  end
}
