return {
  -- LSP
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      {
        "williamboman/mason.nvim",
        config = true,
        keys = {
          {
            "<leader>lI",
            "<cmd>Mason<cr>",
            desc = "Mason Info",
          },
        },
      },
      "williamboman/mason-lspconfig.nvim",
      "zapling/mason-conform.nvim",
      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", opts = {}, event = "User FileOpened" },
    },
    keys = {
      {
        "<leader>li",
        "<cmd>LspInfo<cr>",
        desc = "Info",
      },
    },
    lazy = true,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        -- Load the wezterm types when the `wezterm` module is required
        -- Needs `justinsgithub/wezterm-types` to be installed
        -- { path = "wezterm-types", mods = { "wezterm" } },
      },
    },
    -- dependencies = {
    --   "justinsgithub/wezterm-types",
    -- }
  },
  {
    "Bilal2453/luvit-meta",
    lazy = true,
  }, -- optional `vim.uv` typings
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
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = { "prettierd" },
        css = { "prettierd" },
        go = { "gofumpt", "goimports-reviser" },
        graphql = { "prettierd" },
        handlebars = { "prettierd" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        less = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        markdown_mdx = { "prettierd" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        scss = { "prettierd" },
        svelte = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        vue = { "prettierd" },
        yaml = { "prettierd" },
      },
      format_on_save = custom_nvim.format_on_save.enable and custom_nvim.format_on_save.opts or nil,
    },
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format {
            async = true,
            lsp_fallback = true,
          }
        end,
        desc = "Format",
        mode = { "n", "v" },
      },
    },
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
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      if require("user.lsp.utils").is_vue_project() then
        return
      end

      require("typescript-tools").setup {
        capabilities = custom_nvim.lsp.capabilities,
        on_attach = function(client)
          client.server_capabilities.document_formatting = false
          client.server_capabilities.document_range_formatting = false
          -- client.server_capabilities.semanticTokensProvider = nil
        end,
        settings = {
          expose_as_code_action = "all",
          tsserver_file_preferences = {
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      }
    end,
    cond = custom_nvim.lsp.use_typescript_tools,
    keys = {
      {
        "<leader>lo",
        "<cmd>TSToolsOrganizeImports<cr>",
        desc = "Organize Imports",
      },
    },
    event = "User FileOpened",
  },
  {
    "dmmulroy/tsc.nvim",
    opts = {},
    event = "User FileOpened",
  },
}
