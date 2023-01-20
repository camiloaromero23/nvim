return {
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

  -- Null LS
  { "tamago324/nlsp-settings.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "user.null_ls"
    end,
  },

  -- CMP
  "onsails/lspkind-nvim", -- Completion icons
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-nvim-lsp", -- lsp completions
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "L3MON4D3/LuaSnip", -- Snippets
  "rafamadriz/friendly-snippets", -- Pre-made snippets
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      local ok, tailwind_colorizer = pcall(require, "tailwindcss-colorizer-cmp")
      if not ok then
        return
      end
      tailwind_colorizer.setup {
        color_square_width = 2,
      }
    end,
  },
}
