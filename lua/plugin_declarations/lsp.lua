return {
  -- LSP
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "jay-babu/mason-nvim-dap.nvim",

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",

      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", tag = "legacy", opts = {}, event = "User FileOpened" },
    },
    lazy = true,
  },
  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Autocompletion
      "onsails/lspkind-nvim", -- Completion icons
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",

      -- Adds a number of user-friendly snippets
      "rafamadriz/friendly-snippets",
    },
    lazy = true,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = true,
    event = "InsertEnter",
  },

  -- Null-LS
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "user.lsp.null_ls"
    end,
    event = "User FileOpened",
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require "user.lsp.server_configurations.rust_analyzer"
    end,
    ft = { "rust", "rs" },
  },
  {
    "olexsmir/gopher.nvim",
    opts = {
      commands = {
        go = "go",
        gomodifytags = os.getenv "HOME" .. "/go/bin/gomodifytags",
        gotests = os.getenv "HOME" .. "/go/bin/gotests",
        impl = os.getenv "HOME" .. "/go/bin/impl",
        iferr = os.getenv "HOME" .. "/go/bin/iferr",
      },
    },
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
    ft = { "go", "gomod" },
  },
}
