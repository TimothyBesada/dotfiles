-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>w!", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>!", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<C-M-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<C-M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Delete to black hole
map("n", "<leader>d", '"_d', { desc = "Delete to Black Hole" })

-- Move Lines (visual and normal mode handled by mini.move)
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
-- map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
-- map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
-- map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Spider motions
map({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
map({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
map({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })

-- Insert motions
map("i", "<M-Right>", "<Esc>l<cmd>lua require('spider').motion('w')<CR>i")
map("i", "<M-Left>", "<Esc><cmd>lua require('spider').motion('b')<CR>i")
map("i", "<M-Del>", "<Esc>ld<cmd>lua require('spider').motion('w')<CR>i")
map("i", "<M-BS>", "<Esc>ld<cmd>lua require('spider').motion('b')<CR>i")

-- Add new line while in normal mode
map("n", "<leader><CR>", "O<Esc>", { desc = "Add empty line above" })
map("n", "<CR>", "o<Esc>", { desc = "Add empty line below" })

-- Select to end of line
map("n", "‹", "v$", { desc = "Select to end of line" })

-- Open oil nvim
map("n", "-", "<CMD>Oil --float<CR>", { desc = "Oil: Open parent directory" })

map("n", "_", "<CMD>Oil<CR>", { desc = "Oil: Open parent directory" })

-- Toggle inline git blame
map("n", "<leader>gt", "<CMD>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle inline git blame" })
