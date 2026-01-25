vim.pack.add({
    {src= github("chrisgrieser/nvim-lsp-endhints")},
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("config.lsp.eol-inlayhints", {}),
    callback = function (args)
        _ = args

        require("lsp-endhints").setup({
            label = {
                truncateAtChars = 50,
            },
        })
    end
})
