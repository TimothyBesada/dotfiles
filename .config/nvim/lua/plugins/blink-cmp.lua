return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    completion = {
      menu = {
        border = vim.g.borderStyle,
      },
      documentation = {
        window = {
          border = vim.g.borderStyle,
        },
      },
    },
    signature = {
      window = {
        border = vim.g.borderStyle,
      },
    },
  },
}
