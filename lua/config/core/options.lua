vim.cmd("let g:netrw_liststyle = 3")

vim.cmd("syntax off")

local opt = vim.opt
local o = vim.o

opt.number = true -- enables line number
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 4 -- spaces for tabs
opt.shiftwidth = 4 -- spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- will follow indentation level from previous line

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case when searching, assumes you want case-sensitive

-- terminal color rendering
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- vertical split moves new window to the right
opt.splitbelow = true -- horizontal split moves new window to the bottom
