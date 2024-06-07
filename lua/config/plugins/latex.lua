return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- vim.g.vimtex_view_method = "mupdf"
    vim.g.vim_compiler_method = "latexrun"
    -- this doesnt want to work so just put the comment at the top of you main.tex
    vim.g.vimtex_compiler_engine = "xelatex" -- %! TEX TS-program = xelatex
  end,
}
