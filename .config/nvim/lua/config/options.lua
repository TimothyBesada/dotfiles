-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- For floatng bar transparency
vim.opt.termguicolors = true
vim.o.pumblend = 0
vim.o.winblend = 0

vim.g.borderStyle = "rounded"

-- Line wrap
-- vim.opt.wrap = true

-- Cursor scrolloff
-- vim.opt.scrolloff = 20

-- Python
-- LSP Server to use for Python.
-- vim.g.lazyvim_python_lsp = "basedpyright"
-- vim.g.lazyvim_python_ruff = "ruff"

-- For Avante
vim.opt.laststatus = 3

vim.g.snacks_animate = false

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = "WarningMsg",
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticHint",
    },
  },
})
