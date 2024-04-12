local M = {}

function M.setup()
  -- auto install packer if not installed
  local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end

  local packer_bootstrap = ensure_packer()

  -- autocommand that reloads neovim and installs/updates/removes plugins
  -- when file is saved
  vim.cmd([[ 
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]])


  -- import packer safely
  local status, packer = pcall(require, "packer")
  if not status then
    return
  end

  -- add list of plugins to install
  return packer.startup(function(use)
    -- packer can manage itself  
    use("wbthomason/packer.nvim")
    
    -- Color scheme
    use("sainnhe/sonokai")
    -- use("bluz71/vim-nightfly-guicolors")

    -- Look and feel
    use {
      "catppuccin/nvim",
      config = function()
        require("config.catppuccin").setup()
      end,
    }

    -- Neotree
    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      },
      config = function()
        require("config.neo-tree").setup()
      end
    }

    -- LSP
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      config = function()
        require("config.lsp").setup()
      end,
    }

    -- Terminal
    use {
      "akinsho/toggleterm.nvim", 
      tag = '*', 
      config = function()
        require("config.toggleterm").setup()
      end,
    }

    -- 
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',
      requires = { 
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          run = "make",
        },
    },
      config = function()
        require("config.telescope").setup()
      end,
}


    use("christoomey/vim-tmux-navigator") -- tmux & split screen navigation

    use("hashivim/vim-terraform")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end)

end

return M
