vim.pack.add({
    {
        src = github("nvim-treesitter/nvim-treesitter"),
        version = "master",
    },
})

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    ensure_installed = {
        "lua",
        "sql",
        "html",
        "css",
        "vimdoc",
    },
})
