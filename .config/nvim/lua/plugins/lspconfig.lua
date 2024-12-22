return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
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
  },
}
