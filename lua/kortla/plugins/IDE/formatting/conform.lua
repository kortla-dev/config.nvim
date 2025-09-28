local function listToSet(list)
  local set = {}

  for _, v in ipairs(list) do
    set[v] = true
  end

  return set
end

local filetype_filter = listToSet({
  "php",
  "blade",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype
    if filetype_filter[filetype] then
      return
    end

    local options = {
      bufnr = args.buf,
      timeout_ms = 1000,
      lsp_format = "fallback",
    }

    -- local ft_ms = {
    --   ["php"] = 2000,
    --   ["blade"] = 2500,
    -- }
    --
    -- if ft_ms[filetype] then
    --   options.timeout_ms = ft_ms[filetype]
    -- end

    require("conform").format(options)
  end,
})

local M = {
  "stevearc/conform.nvim",
}

M.event = { "BufReadPre", "BufNewFile" }

M.opts = {
  formatters_by_ft = {
    lua = { "stylua" },
    json = { "prettier" },
    php = { "pint" },
    blade = { "blade-formatter" },
    nix = { "nixfmt" },
  },
}

M.keys = {
  {
    "<localleader>mf",
    function()
      require("conform").format({ async = true })
    end,
    mode = "n",
    desc = "Local: [m]anual [f]ormat",
  },
}

return M
