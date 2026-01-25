vim.pack.add({
    { src = github("numToStr/comment.nvim") },
})

require("Comment").setup({
    padding = true,
    sticky = true,
    mappings = {
        basic = true,
    },
})
