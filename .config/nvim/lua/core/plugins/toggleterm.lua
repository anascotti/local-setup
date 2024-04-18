local M = {
  "akinsho/toggleterm.nvim", 
  version = '*', 
    config = function()
      require("toggleterm").setup {
        open_mapping = "<C-n>", -- toggle terminal
        size = 20,
        direction = "horizontal",
        shell = vim.o.shell,
      }

      -- keymaps
      local map = vim.api.nvim_set_keymap
      local buf_map = vim.api.nvim_buf_set_keymap

      local opts = { noremap = true }
      map("t", "<ESC>", "<C-\\><C-n>", opts) -- back to normal mode in Terminal
      
      -- navigation to and from terminal
      local set_terminal_keymaps = function()
        buf_map(0, "t", "<esc>", [[<C-\><C-n>]], opts) -- exit terminal mode
        buf_map(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts) -- switch window
        buf_map(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts) -- switch window
        buf_map(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts) -- clear
      end
    end,
}

return M