return {
  -- Core plugins
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require "user.treesitter-context"
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require "user.autotag"
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.0",
    config = function()
      require "user.telescope"
    end,
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable "make" == 1,
  },

  -- LSP
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require "user.lsp_signature"
    end,
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require "user.inlay_hints"
    end,
  },

  --Null LS
  { "tamago324/nlsp-settings.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "user.null_ls"
    end,
  },

  -- CMP
  { "onsails/lspkind-nvim" }, -- Completion icons
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-nvim-lsp" }, -- lsp completions
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "hrsh7th/cmp-cmdline" }, -- cmdline completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "L3MON4D3/LuaSnip" }, -- Snippets
  -- TODO: Change this with own snippets
  { "rafamadriz/friendly-snippets" }, -- Pre-made snippets

  -- My plugins here
  { "lunarvim/colorschemes" },
  { "marko-cerovac/material.nvim" },
  {
    "max397574/which-key.nvim",
    config = function()
      require "user.which-key"
    end,
    event = "BufWinEnter",
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
    "tpope/vim-fugitive",
  },
  {
    "tpope/vim-surround",
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
  { "antoinemadec/FixCursorHold.nvim" }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  {
    "folke/neodev.nvim",
  },
  { "b0o/schemastore.nvim" },
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
