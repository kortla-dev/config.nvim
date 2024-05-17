return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",

      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left"
        }
      },
    },

    -- Disables italics for the selected buffer
    highlights = {
      buffer_selected = { italic = false },
      diagnostic_selected = { italic = false },
      hint_selected = { italic = false },
      pick_selected = { italic = false },
      pick_visible = { italic = false },
      pick = { italic = false },
    },
  }
}
