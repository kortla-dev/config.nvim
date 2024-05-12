return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = {"~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/"},
    })

    -- Set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<Cmd>SessionRestore<CR>", {desc = "Restore session for cwd"})
    keymap.set("n", "<leader>ws", "<Cmd>SessionSave<CR>", {desc = "Save session for auto session root dir"})
  end
}

