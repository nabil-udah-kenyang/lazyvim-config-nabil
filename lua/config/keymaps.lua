-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Copy di visual mode (Ctrl + y)
vim.keymap.set("v", "<C-y>", '"+y', { noremap = true, silent = true })

-- Paste di insert mode (Ctrl + p)
vim.keymap.set("i", "<C-p>", "<C-r>+", { noremap = true, silent = true })
