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
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional

      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",

      -- Adds a number of user-friendly snippets
      "rafamadriz/friendly-snippets",

      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true, enabled = false }, -- Enable this when plugin loads custom colors,
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
    ft = { "rust", "rs", "toml" },
  },
  {
    "saecki/crates.nvim",
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
      popup = {
        border = "rounded",
      },
    },
    lazy = true,
    ft = { "rust", "rs", "toml" },
    event = "User FileOpened",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "vuki656/package-info.nvim",
    opts = {
      icons = {
        enable = true, -- Whether to display icons
        style = {
          up_to_date = "|  ", -- Icon for up to date dependencies
          outdated = "|  ", -- Icon for outdated dependencies
        },
      },
      autostart = true, -- Whether to autostart when `package.json` is opened
      hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
      hide_unstable_versions = true, -- It hides unstable versions from version list e.g next-11.1.3-canary3
      -- Can be `npm`, `yarn`, or `pnpm`. Used for `delete`, `install` etc...
      -- The plugin will try to auto-detect the package manager based on
      -- `yarn.lock` or `package-lock.json`. If none are found it will use the
      -- provided one, if nothing is provided it will use `yarn`
      package_manager = "pnpm",
    },
    ft = { "json" },
    dependencies = { "MunifTanjim/nui.nvim" },
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
