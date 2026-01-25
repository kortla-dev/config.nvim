vim.pack.add({
    { src = github("nvim-lualine/lualine.nvim") },
    { src = github("nvim-tree/nvim-web-devicons") },
})


local lualine = require("lualine")
-- local lazy_status = require("lazy.status")

lualine.setup({
    sections = {
        lualine_x = {
            -- {
            --     lazy_status.updates,
            --     cond = lazy_status.has_updates,
            --     color = { fg = "#ff964f" },
            -- },
            { "encoding" },
            { "fileformat" },
            { "filetype" },
        },
    },
})
