return {
  "christoomey/vim-tmux-navigator",
  vscode = false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-Left>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<c-Down>", "<cmd>TmuxNavigateDown<cr>" },
    { "<c-Up>", "<cmd>TmuxNavigateUp<cr>" },
    { "<c-Right>", "<cmd>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
  },
}
