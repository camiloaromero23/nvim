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
  use 'wbthomason/packer.nvim' -- Packer manages itself
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
