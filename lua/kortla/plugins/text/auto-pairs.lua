local M = {
    "windwp/nvim-autopairs",
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    event = { "InsertEnter" },
}

M.config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
        check_ts = true,
        ts_config = {
            lua = { "string" },
        },
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
