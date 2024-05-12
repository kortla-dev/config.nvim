return {
   "ellisonleao/gruvbox.nvim",
    priority = 1000, -- makes sure this is loaded first
    config = function()
        vim.cmd("colorscheme gruvbox")
    end
}
