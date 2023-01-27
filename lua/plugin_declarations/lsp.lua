return {
  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      { "williamboman/mason.nvim" }, -- Optional
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
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
  },

  -- Null-LS
  "jay-babu/mason-null-ls.nvim",
  {
    "jose-elias-alvarez/null-ls.nvim",
  },
  "tamago324/nlsp-settings.nvim",
}
