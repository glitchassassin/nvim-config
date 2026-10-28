-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fy", function()
  vim.fn.setreg("+", vim.fn.expand("%:."))
end, { desc = "Copy Relative File Path" })

vim.keymap.set("n", "<leader>fY", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy Absolute File Path" })
