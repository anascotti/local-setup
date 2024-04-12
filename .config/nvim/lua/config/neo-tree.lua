local M = {}

function M.setup()
    
    require("neo-tree").setup{
      popup_border_style = "single",
      enable_git_status = true,
      filesystem = {
        filtered_items = {
            hide_dotfiles = false
        }
      }
    }
    
end

return M