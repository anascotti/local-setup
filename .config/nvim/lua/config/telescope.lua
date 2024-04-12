local M = {}

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

function M.setup()
  
  local actions = require "telescope.actions"
  local telescope = require "telescope"

  telescope.setup({
    pickers = {
      find_files = {
        hidden = false,
      },
      oldfiles = {
        cwd_only = true,
      },
      buffers = {
        ignore_current_buffer = true,
        sort_lastused = true,
      },
      live_grep = {
        only_sort_text = true, -- grep for content and not file name/path
        mappings = {
          i = { ["<c-f>"] = actions.to_fuzzy_refine },
        },
      },
    },
     extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
      fzf = {},
      file_browser = file_browser_config(),
    },

  })
  
  -- keymaps
  local builtin = require('telescope.builtin')
  local keymap = vim.keymap

  keymap.set('n', '<leader>ff', builtin.find_files, {})
  keymap.set('n', '<leader>fg', builtin.live_grep, {})
  keymap.set('n', '<leader>fb', builtin.buffers, {})
  keymap.set('n', '<leader>fh', builtin.help_tags, {})


  -- extensions
  telescope.load_extension "fzf"
end



return M