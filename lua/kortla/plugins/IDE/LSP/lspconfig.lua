local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
}

local function keymap(event, mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = event.buf, silent = true })
end

M.config = function()
    local telescope = require("telescope.builtin")

    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
            local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

            -- print(vim.api.nvim_get_option_value("filetype", { buf = event.buf }))

            -- print(vim.inspect(ev))

            client.server_capabilities.semanticTokensProvider = nil

            if client:supports_method("textDocument/completion") then
                vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = false })
            end

            -- set keymaps
            keymap(event, "n", "<localleader>gd", telescope.lsp_definitions, "[g]oto [d]efinition")
            keymap(event, "n", "<localleader>gt", telescope.lsp_type_definitions, "Show LSP type definitions") -- show lsp type definitions
            keymap(event, { "n", "v" }, "<localleader>ca", vim.lsp.buf.code_action, "See available [c]ode [a]ctions") -- see available code actions
            keymap(event, "n", "<localleader>rn", vim.lsp.buf.rename, "[s]mart [r]ename") -- smart rename
            keymap(event, "n", "<localleader>sd", function()
                telescope.diagnostics({ buffer = event.buf })
            end, "[s]how buffer [d]iagnostics") -- show diagnostics
            keymap(event, "n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics") -- show diagnostics for line
            keymap(event, "n", "<localleader>pd", vim.diagnostic.get_prev, "Go to [p]revious [d]iagnostics") -- jump to previous diagnostic in buffer
            keymap(event, "n", "<localleader>nd", vim.diagnostic.get_next, "Go to [n]ext [d]iagnostic") -- jump to next diagnostic in buffer
            keymap(event, "n", "<localleader>K", vim.lsp.buf.hover, "Show documentation for what is under cursor") -- show documentation for what is under cursor
            keymap(event, "n", "<localleader>rs", ":LspRestart<CR>", "[r]estart [l]SP") -- mapping to restart lsp if necessary

            -- vim.lsp.config(server, cfg)
            -- vim.lsp.enable(file_type_lsp, true)
        end,
    })

    -- Define sign icons for each severity
    -- local signs = {
    --   [vim.diagnostic.severity.ERROR] = " ",
    --   [vim.diagnostic.severity.WARN]  = " ",
    --   [vim.diagnostic.severity.HINT]  = "󰠠 ",
    --   [vim.diagnostic.severity.INFO]  = " ",
    -- }

    vim.diagnostic.config({
        -- signs = {
        --   text = signs, -- Enable signs in the gutter
        -- },
        virtual_text = true,
        underline = true,
        update_in_insert = false, -- Keep diagnostics active in insert mode
    })

    ---@type table<string, table>
    local servers = {
        ["intelephense"] = {
            filetypes = { "php" },
            root_markers = { ".git" },
        },
        ["stimulis_language_server"] = {
            filetypes = { "blade" },
        },
        ["zls"] = {
            filetypes = { "zig", "zon" },
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    inlay_hints_show_builtin = true,
                },
            },
        },
        -- ["clangd"] = {
        --     filetypes = { "c", "cpp", "h" },
        --     root_markers = { ".clang-format" },
        -- },
    }
end

return M
