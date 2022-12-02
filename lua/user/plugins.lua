local fn = vim.fn

-- Automatically install packer
local ensure_packer = function()
  local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local ok, packer = pcall(require, "packer")
if not ok then
  return
end

local packer_group = vim.api.nvim_create_augroup("PackerUserConfig", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = packer_group,
  pattern = { "plugins.lua" },
  command = "source <afile> | PackerSync",
})

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded"}
    end,
  },
}

packer.startup(function(use)
  -- Core plugins
  use 'wbthomason/packer.nvim' -- Packer manages itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require "user.treesitter-context"
    end,
  }
  use {
    "p00f/nvim-ts-rainbow",
    requires = {"nvim-treesitter/nvim-treesitter"}
  }
  use {
    "windwp/nvim-ts-autotag",
    config = function()
      require "user.autotag"
    end,
    requires = { "nvim-treesitter/nvim-treesitter" },
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
    requires = { "nvim-treesitter/nvim-treesitter" },
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    config = function()
      require "user.telescope"
    end,
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable "make" == 1
  }


  -- My plugins here
  use "lunarvim/colorschemes"
  use "marko-cerovac/material.nvim"
  use {
    "max397574/which-key.nvim",
    config = function()
      require "user.which-key"
    end,
    event = "BufWinEnter",
  }
  use {
    'goolord/alpha-nvim',
    config = function()
      require "user.alpha"
    end,
  }
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require "user.devicons"
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require("user.nvimtree").setup()
    end,
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
    'akinsho/bufferline.nvim',
    config = function()
      require "user.bufferline"
    end,
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require "user.lualine"
    end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "user.gitsigns"
    end,
    event = "BufRead",
  }
  use {
    "f-person/git-blame.nvim",
    config = function()
      require "user.git_blame"
    end,
  }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  }
  use {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    event = "CursorMoved",
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("user.indent_blankline").config()
    end,
  }
  use {
    "tpope/vim-fugitive",
  }
  use {
    "tpope/vim-surround",
  }
  use {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("user.nvim_colorizer").config()
    end,
  }
  use {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require "user.comment"
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
