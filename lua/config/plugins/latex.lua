return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- vim.g.vimtex_view_method = "mupdf"
    -- this doesnt want to work so just put the comment at the top of you main.tex
    -- vim.g.vimtex_compiler_engine = "xelatex" -- %! TEX TS-program = xelatex

    -- vim.g.vim_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      executable = "latexmk",
      continuous = 0,
      options = {
        "-xelatex",
        "-quiet",
        "-interaction=nonstopmode",
        "-synctex=1",
      },
    }
  end,
}
