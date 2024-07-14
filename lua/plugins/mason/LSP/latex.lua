return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- this doesnt want to work so just put the comment at the top of you main.tex
    -- vim.g.vimtex_compiler_engine = "xelatex" -- %! TEX TS-program = xelatex

    vim.g.vimtex_compiler_latexmk = {
      executable = "latexmk",
      continuous = 0,
      options = {
        "-xelatex",
        "-interaction=nonstopmode",
        "-synctex=1",
      },
    }
  end,
}
