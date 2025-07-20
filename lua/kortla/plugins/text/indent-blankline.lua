local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = {
        "BufNewFile", -- before editing a non-existent file
        "BufReadPre", -- before reading a file
    },
    main = "ibl",
}

M.opts = {
    indent = { char = "┊" },
    scope = { enabled = false },
}

return M
