local M = {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      integrations = {
        markdown = true,
        mason = true,
        neotree = true,
      }
    }
  end, 
 
}

 --vim.cmd.colorscheme "catppuccin"

return M