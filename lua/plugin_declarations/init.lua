return {
  -- Core plugins
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

  -- My plugins
  "folke/neodev.nvim",
  "navarasu/onedark.nvim",
  "lunarvim/darkplus.nvim",
  "marko-cerovac/material.nvim",
  "tpope/vim-surround",
  "b0o/schemastore.nvim",
  { "exafunction/codeium.vim", enabled = custom_nvim.enable_codeium },
  { "github/copilot.vim", enabled = custom_nvim.enable_copilot },

  {
    "folke/which-key.nvim",
  },
  -- Git
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
  },
  {
    "f-person/git-blame.nvim",
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
  },
  {
    "goolord/alpha-nvim",
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
  },
  {
    "NvChad/nvim-colorizer.lua",
  },
  {
    "ahmedkhalf/project.nvim",
  },

  {
    "windwp/nvim-autopairs",
    -- event = "InsertEnter",
  },
  {
    "fatih/vim-go",
    ft = { "go" },
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust", "rs" },
  },
  {
    "axelvc/template-string.nvim",
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  },
  {
    "camiloaromero23/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  },
  {
    "SmiteshP/nvim-navic",
  },
  "mbbill/undotree",
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {
        signs = false,
        highlight = { multiline = false },
      }
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    event = "CursorMoved",
  },
  -- WARN: Do not move to after/plugin
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require "user.devicons"
    end,
  },
}
