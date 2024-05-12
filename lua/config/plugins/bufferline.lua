return {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    version = "*",
    opts = {
      options = {
        mode = "tabs",
        separator_style = "slant"
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
  
