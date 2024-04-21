vim.g.mapleader = " "

local keymap = vim.keymap

-- disable arrow keys
keymap.set("", "<up>", "<nop>")
keymap.set("", "<down>", "<nop>")
keymap.set("", "<left>", "<nop>")
keymap.set("", "<right>", "<nop>")

-- general keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with j jkk" }) -- mode
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clean search

-- split windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split windo
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab
