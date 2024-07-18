return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    term_colors = true,
    transparent_background = true,
    custom_highlights = function()
      return {
        Visual = { bg = "#473A5C" },
        FlashCurrent = { fg = "#B1E6A7" },
        FlashLabel = { fg = "#FAB387" },
        LspReferenceWrite = { underline = true, bg = "" },
      }
    end,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
