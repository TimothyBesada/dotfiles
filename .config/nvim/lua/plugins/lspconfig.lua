return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectory = { mode = "auto" },
        },
      },
      basedpyright = {
        settings = {
          basedpyright = {
            disablerganizeImports = true,
            hoverProvider = false,
            analysis = {
              typeCheckingMode = "basic", -- off, basic, standard, strict, all
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              autoImportCompletions = true,
              diagnosticsMode = "workspace", -- workspace, openFilesOnly
              diagnosticSeverityOverrides = {
                -- reportUnusedImports = false,
                -- reportUnusedVariable = false,
                -- reportUnusedClass = "warning",
                -- reportUnusedFunction = "warning",
                reportUndefinedVariable = false, -- ruff handles this with F822
              },
            },
          },
        },
      },
    },
    setup = {
      eslint = function()
        -- automatically fix linting errors on save (but otherwise do not format the document)
        vim.cmd([[
          autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
        ]])
      end,
    },
  },
}
