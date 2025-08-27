vim.cmd("let g:netrw_banner = 0")

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false
opt.title = true

opt.backup = false
opt.undofile = true -- persistent undos across neovim instances

opt.incsearch = true
opt.inccommand = "split"
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.cursorline = true

opt.backspace = { "start", "eol", "indent" }

opt.splitright = true
opt.splitbelow = true

opt.updatetime = 50

opt.clipboard:append("unnamedplus")
opt.hlsearch = true

opt.mouse = "a"
vim.g.editorconfig = true
