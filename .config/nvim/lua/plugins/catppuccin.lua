return {
  "catppuccin/nvim",
  name = "catppuccin",
  -- init = function()
  --   vim.opt.winblend = 50
  -- end,
  opts = {
    term_colors = true,
    transparent_background = true,
    custom_highlights = function()
      return {
        Visual = { bg = "#473A5C" },
        FlashCurrent = { fg = "#B1E6A7" },
        FlashLabel = { fg = "#FAB387" },
      }
    end,
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dashboard = true,
      flash = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      mason = true,
      markdown = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      navic = { enabled = true, custom_bg = "lualine" },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
