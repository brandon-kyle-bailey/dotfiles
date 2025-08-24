---@diagnostic disable: need-check-nil
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- move 1/2 screen up/down and center vertically
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")

-- bind jk to escape action
vim.keymap.set("i", "jk", "<Esc>")
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })

-- generate and insert a random uuid after the cursor
vim.keymap.set("n", "<leader>cud", function()
  local handle = io.popen("uuidgen | tr '[:upper:]' '[:lower:]'")
  local uuid = handle:read("*a")
  handle:close()
  uuid = uuid:gsub("%s+", "")
  local _, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line(line:sub(1, col + 1) .. uuid .. line:sub(col + 2))
end, { desc = "Generate and insert random UUID after cursor" })

-- buffer path copying to clipboard
vim.keymap.set("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
  print("Copied: " .. vim.fn.expand("%"))
end, { desc = "Copy the relative file path of the in-focus buffer" })

vim.keymap.set("n", "<leader>cP", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  print("Copied: " .. vim.fn.expand("%:p"))
end, { desc = "Copy the absolute file path of the in-focus buffer" })
