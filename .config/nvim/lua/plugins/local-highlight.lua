return {
  "tzachar/local-highlight.nvim",
  config = function()
    require("local-highlight").setup({
      hlgroup = "LspReferenceWrite",
      cw_hlgroup = "LspReferenceWrite",
    })
  end,
}
