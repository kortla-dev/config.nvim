local M = {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
}

M.config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "lua",
            "sql",
            "html",
            "css",
            "vimdoc",
        },
    })
end

return M
