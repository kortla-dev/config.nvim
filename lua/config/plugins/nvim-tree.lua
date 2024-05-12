return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- Recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
      },
      -- Disable window_picker for
      -- explorer to work well with
      -- windows splits
      actions = {
        open_file = {
          window_picker = {
            enable = false
          }
        }
      },
      filters = {
        custom = {".DS_Store"}
      },
      git = {
        ignore = false
      }
    })

    -- Set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- Toggle file explorer
    keymap.set("n", "<leader>ef", "<Cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- Toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<Cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- Collapse file explorer
    keymap.set("n", "<leader>er", "<Cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- Refresh file explorer
  end
}