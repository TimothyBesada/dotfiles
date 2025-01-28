return {
  "nvim-treesitter/nvim-treesitter",
  vscode = true,
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        -- init_selection = "<C-space>",
        node_incremental = "v",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
