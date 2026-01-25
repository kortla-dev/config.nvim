vim.pack.add({
    { src = github("stevearc/oil.nvim") },
    { src = github("nvim-tree/nvim-web-devicons") },
})

require("oil").setup({
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
    },
    delete_to_trash = true,

    keymaps = {
        ["<C-h>"] = {},
        ["<C-l>"] = {},
    },
})

nmap("-", "<CMD>Oil<CR>")
