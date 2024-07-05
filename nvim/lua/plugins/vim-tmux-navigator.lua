return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-n>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<c-e>", "<cmd>TmuxNavigateDown<cr>" },
    { "<c-i>", "<cmd>TmuxNavigateUp<cr>" },
    { "<c-o>", "<cmd>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
  },
}
