return {
  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      }, -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      "onsails/lspkind-nvim", -- Completion icons
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    },
    lazy = true,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    config = function()
      require "user.lsp.cmp"
    end,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = true,
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
    event = "User FileOpened"
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require "user.lsp.server_configurations.rust_analyzer"
    end,
    ft = { "rust", "rs" },
  },
  {
    "fatih/vim-go",
    config = function()
      require "user.lsp.vim-go"
    end,
    ft = { "go", "gomod" },
  },
}
