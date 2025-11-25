local lua_ls = {
    filetypes = { "lua" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                library = {
                    vim.fs.normalize(vim.fs.joinpath(vim.env.VIMRUNTIME, "lua")),
                },
            },
            diagnostics = {
                globals = { "vim" },
            },
            hint = { enable = true }, -- inlay hints
        },
    },
}

return lua_ls
