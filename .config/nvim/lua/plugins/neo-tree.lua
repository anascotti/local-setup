local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup{
      popup_border_style = "single",
      enable_git_status = true,
      filesystem = {
        filtered_items = {
            hide_dotfiles = false
        }
      }
    }

    -- key maps
    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>Neotree reveal toggle<cr>", { desc = "Toggle Filetree" })
  end

}

return M