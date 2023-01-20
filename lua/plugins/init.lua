return {
  -- Core plugins
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

  -- My plugins
  "folke/neodev.nvim",
  "navarasu/onedark.nvim",
  "marko-cerovac/material.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "b0o/schemastore.nvim",

  {
    "folke/which-key.nvim",
    config = function()
      require "user.which-key"
    end,
    event = "BufWinEnter",
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
    "goolord/alpha-nvim",
    config = function()
      require "user.alpha"
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require "user.devicons"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("user.nvimtree").setup()
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require "user.bufferline"
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "user.lualine"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "user.gitsigns"
    end,
    event = "BufRead",
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      require "user.git_blame"
    end,
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
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("user.indent_blankline").config()
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("user.nvim_colorizer").config()
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require "user.comment"
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require "user.project"
    end,
  },

  {
    "windwp/nvim-autopairs",
    -- event = "InsertEnter",
    config = function()
      require "user.autopairs"
    end,
  },
  {
    "fatih/vim-go",
    config = function()
      require "user.vim-go"
    end,
    ft = { "go" },
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require "user.rust_tools"
    end,
    ft = { "rust", "rs" },
  },
  {
    "axelvc/template-string.nvim",
    config = function()
      require "user.template_string"
    end,
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      require "user.breadcrumbs"
    end,
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require "user.harpoon"
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end,
  },
}
