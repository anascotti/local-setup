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
--vim.opt.runtimepath:prepend(lazypath)

-- Remap , as leader key
-- Must be before lazy
vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<cr>")

require("lazy").setup("plugins", {
  -- defaults = { lazy = true },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
  debug = false,
})
