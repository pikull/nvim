local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', "<C-h>", "<C-w>h", opts)
vim.keymap.set('n', "<C-j>", "<C-w>j", opts)
vim.keymap.set('n', "<C-k>", "<C-w>k", opts)
vim.keymap.set('n', "<C-l>", "<C-w>l", opts)

vim.keymap.set('n', "<C-d>", "<C-d>zz", opts)
vim.keymap.set('n', "<C-u>", "<C-u>zz", opts)
