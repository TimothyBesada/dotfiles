return {
  "folke/flash.nvim",
  vscode = true,
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "v", mode = { "o", "x" },
    --       function()
    --         require("flash").treesitter({
    --           actions = {
    --             ["v"] = "next",
    --             ["<BS>"] = "prev"
    --           },
    --           label = {after = false, before = false},
    --         })
    --       end,
    --       desc = "Treesitter Incremental Selection"
    --     },
  },
}
