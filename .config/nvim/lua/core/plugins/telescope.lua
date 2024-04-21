local function file_browser_config()
    local fb_actions = require("telescope").extensions.file_browser.actions
    return {
      theme = "ivy",
      hijack_netrw = false,
      hidden = true,
      mappings = {
        i = {
          ["<c-n>"] = fb_actions.create,
          ["<c-r>"] = fb_actions.rename,
          -- ["<c-h>"] = actions.which_key,
          ["<c-h>"] = fb_actions.toggle_hidden,
          ["<c-x>"] = fb_actions.remove,
          ["<c-p>"] = fb_actions.move,
          ["<c-y>"] = fb_actions.copy,
          ["<c-a>"] = fb_actions.select_all,
        },
      },
    }
end

local M = {
  'nvim-telescope/telescope.nvim',
  branch = "0.1.x",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    "nvim-tree/nvim-web-devicons",
    --"crispgm/telescope-heading.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    --"nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local actions = require "telescope.actions"
    local telescope = require "telescope"

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },

    })
    
    -- extensions
    telescope.load_extension("fzf")

    -- keymaps
    local keymap = vim.keymap
    keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd"})
    keymap.set('n', '<leader>fr', "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files"})
    keymap.set('n', '<leader>fs', "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy string in cwd"})
    keymap.set('n', '<leader>fc', "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor"})
    end,
  
}

return M