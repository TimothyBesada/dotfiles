return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    term_colors = true,
    integrations = {
      blink_cmp = true,
    },
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
