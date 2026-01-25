require("util")
require("core")
require("plugins")
require("current-theme")

-- kortla/pastelbox.nvim

vim.pack.add({
    -- { src = github("kortla-dev/pastelbox.nvim") },

    -- { src = codeberg("kortla/pastelbox.nvim") },
    -- { src = github("rktjmp/lush.nvim") },

    { src = github("lukas-reineke/indent-blankline.nvim") },

    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
})




require("mason").setup()
require("ibl").setup({
    indent = { char = "┊" },
    scope = { enabled = false },
})


-- vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- vim.cmd("set completeopt+=noselect")

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('config.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        -- completion
        if client:supports_method('textDocument/completion') then
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        -- format on save
        if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, })
                end,
            })
        end
    end,
})

vim.cmd("set completeopt+=menu,menuone,noinsert")

-- vim.lsp.enable({ "lua_ls" })

-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(event)
--         local client = vim.lsp.get_client_by_id(event.data.client_id)
--
--         if client:supports_method("textDocument/completion") then
--             vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
--         end
--     end
-- })

-- vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")

-- vim.cmd("colorscheme pastelbox")
