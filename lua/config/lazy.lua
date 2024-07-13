local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  -- plugins
  {
    { import = "config.plugins" },
    { import = "config.plugins.ide_config" },
    {import = "config.plugins.ide_config.LSP"},
    -- {import = "config.plugins.ide_config.DAP"},
    {import = "config.plugins.ide_config.Lint"},
    {import = "config.plugins.ide_config.Formatter"},
  },
  -- lazy.nvim options
  {
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
  }
)
