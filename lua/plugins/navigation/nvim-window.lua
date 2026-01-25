vim.pack.add({
    { src = github("yorickpeterse/nvim-window") },
})

nmap("<leader>w", require("nvim-window").pick)
