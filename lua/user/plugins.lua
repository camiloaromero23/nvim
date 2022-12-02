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


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
