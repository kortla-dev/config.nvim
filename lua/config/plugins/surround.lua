return {
  "kylechui/nvim-surround",
  event = {"BufReadPre", "BufNewFile"},
  version = "*",
  config = true
}

-- surround text   ysiw [input]    ysiw"
-- surround string  ys$ [input]    ys$"
-- delete surround   ds [input]    ds"
-- change surround cs [old] [new]  cs'"
