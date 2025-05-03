-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    -- { import = "plugins" },
    { import = "plugins/theme" },
    { import = "plugins/ui" },
    { import = "plugins/IDE" },
    { import = "plugins/IDE/DAP" },

    { import = "plugins/IDE/LSP" },
    { import = "plugins/IDE/LSP/lang/after" },

    { import = "plugins/IDE/formatting" },
    { import = "plugins/IDE/linting" },
    { import = "plugins/navigation" },
    { import = "plugins/text" },
  },

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "pastelbox" } },

  -- automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false,
  },

  -- desables notification when changes in config are detected
  change_detection = {
    notify = false,
  },
})
