return {
  "lukas-reineke/indent-blankline.nvim", 
  event = {
    "BufNewFile", -- before editing a non-existent file
    "BufReadPre", -- before reading a file
  },
  main = "ibl", 
  opts = {
    indent = { char = "┊" },
    scope = { enabled = false },
  }
}
