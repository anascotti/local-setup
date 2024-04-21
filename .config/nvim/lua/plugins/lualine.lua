return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require ("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
  
    local C = require("catppuccin.palettes").get_palette(flavour)
    local O = require("catppuccin").options
    local catppuccin = {}

    local transparent_bg = O.transparent_background and "NONE" or C.mantle

    catppuccin.normal = {
      a = { bg = C.blue, fg = C.mantle, gui = "bold" },
      b = { bg = C.surface0, fg = C.blue },
      c = { bg = transparent_bg, fg = C.text },
    }

    catppuccin.insert = {
      a = { bg = C.green, fg = C.base, gui = "bold" },
      b = { bg = C.surface0, fg = C.green },
    }

    catppuccin.terminal = {
      a = { bg = C.green, fg = C.base, gui = "bold" },
      b = { bg = C.surface0, fg = C.green },
    }

    catppuccin.command = {
      a = { bg = C.peach, fg = C.base, gui = "bold" },
      b = { bg = C.surface0, fg = C.peach },
    }

    catppuccin.visual = {
      a = { bg = C.mauve, fg = C.base, gui = "bold" },
      b = { bg = C.surface0, fg = C.mauve },
    }

    catppuccin.replace = {
      a = { bg = C.red, fg = C.base, gui = "bold" },
      b = { bg = C.surface0, fg = C.red },
    }

    catppuccin.inactive = {
      a = { bg = transparent_bg, fg = C.blue },
      b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
      c = { bg = transparent_bg, fg = C.overlay0 },
    }

    lualine.setup({
      options = {
        theme = catppuccin,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
    end,
 
}
