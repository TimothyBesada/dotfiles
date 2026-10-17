-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- local function save()
--   local buf = vim.api.nvim_get_current_buf()
--
--   vim.api.nvim_buf_call(buf, function()
--     vim.cmd("silent! write")
--   end)
-- end
--
-- vim.api.nvim_create_augroup("AutoSave", {
--   clear = true,
-- })
--
-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
--   callback = function()
--     save()
--   end,
--   pattern = "*",
--   group = "AutoSave",
-- })
--

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    -- When the client is Biome, add an automatic event on
    -- save that runs Biome's "source.fixAll.biome" code action.
    -- This takes care of things like JSX props sorting and
    -- removing unused imports.
    if client.name == "biome" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("BiomeFixAll", { clear = true }),
        callback = function()
          vim.lsp.buf.code_action({
            context = {
              only = { "source.fixAll.biome" },
              diagnostics = {},
            },
            apply = true,
          })
        end,
      })
    end
  end,
})
