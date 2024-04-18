local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","

require("config")
--require("plugins").setup()
--require("anscotti.plugins.plugins-setup")
--require("anscotti.plugins.neo-tree")
--require("anscotti.core.options")
--require("core.keymaps")
--require("anscotti.core.colorschemes")

