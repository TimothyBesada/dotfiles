return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  vscode = true,
  opts = {
    flavour = "mocha",
    term_colors = true,
    integrations = {
      blink_cmp = true,
    },
    transparent_background = true,
    custom_highlights = function()
      return {
        Visual = { bg = "#473A5C" },
        LspReferenceWrite = { underline = true, bg = "" },
      }
    end,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
