local M = {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
}

M.config = function()
  require("nvim-autopairs").setup({
    check_ts = true,
    enable_moveright = true,
  })
end

return M
