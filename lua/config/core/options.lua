-- vim.cmd("syntax off")

local options = {
  autoindent = true, -- copy indent from current line when starting a new line
  background = "dark", -- colorschemes that can be used with dark background
  backspace = "indent,eol,start", -- allow backspace on indent, end of line or insert mode start position
  clipboard = "unnamedplus", -- neovim will use system clipboard
  copyindent = true, -- copy the previous indentation on autoindenting
  cursorline = true, -- highlight line cursor is on
  expandtab = true, -- convert tabs to spaces
  ignorecase = true, -- ignore case when searching
  number = true, -- show line number
  relativenumber = true, -- show relative line number
  signcolumn = "yes", -- always show the sign column
  smartcase = true, -- if you include mixed case when searching, assumes you want case-sensitive
  splitbelow = true, -- vertical split moves new window to the right
  splitright = true, -- horizontal split moves new window to the bottom
  title = true, -- set terminal title to filename and path
  wrap = false, -- line wrapping
  shiftwidth = 4,
  tabstop = 4,
}

local globals = {
  loaded_netrw = 1,
  loaded_netrwPlugin = 1,
  editorconfig = true,
  termguicolors = true, -- enable 24-bit RGB color in the TUI
}

-- options
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- globals
for k, v in pairs(globals) do
  vim.g[k] = v
end
