vim.g.mapleader = ","

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>") -- mode
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clean search

keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split windo

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab 
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab
