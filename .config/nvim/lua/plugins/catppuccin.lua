local M = {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      integrations = {
        cmp = true,
        gitsigns = true,
        markdown = true,
        mason = true,
        neotree = true,
        treesitter = true,
        telescope = {
          enabled = true,
        },
      },
    }
  end, 
 
}

 --vim.cmd.colorscheme "catppuccin"

return M