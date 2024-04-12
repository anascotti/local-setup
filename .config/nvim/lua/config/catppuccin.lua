local M = {}

function M.setup()
  require("catppuccin").setup {
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    integrations = {
      markdown = true,
      mason = true,
      neotree = true,
    }
  }

end

vim.cmd.colorscheme "catppuccin"

return M