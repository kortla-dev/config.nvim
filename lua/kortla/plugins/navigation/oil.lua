local M = {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
    local oil = require("oil")

    oil.setup({
        default_file_explorer = true,
        view_options = {
            show_hidden = true,
        },
        delete_to_trash = true,
    })

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

return M
