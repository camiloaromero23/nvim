return {
  -- Core plugins
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

  -- My plugins
  { "folke/neodev.nvim", ft = { "lua" } },
  "tpope/vim-surround",
  "b0o/schemastore.nvim",

  {
    "folke/which-key.nvim",
    config = function()
      require "user.which-key"
    end,
  },
  -- Git
  { "tpope/vim-fugitive", event = "User FileOpened" },
  {
    "goolord/alpha-nvim",
    config = function()
      require "user.alpha"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "user.lualine"
    end,
    event = "User FileOpened",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      show_current_context_start = true,
      buftype_exclude = { "terminal", "nofile" },
    },
    event = "User FileOpened",
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require "user.autopairs"
    end,
    -- lazy = true,
    event = "User FileOpened",
  },
  {
    "axelvc/template-string.nvim",
    opts = {
      filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }, -- filetypes where the plugin is active
      jsx_brackets = true, -- must add brackets to jsx attributes
      remove_template_string = true, -- remove backticks when there are no template string
    },
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      require "user.breadcrumbs"
    end,
    event = "User FileOpened",
  },
  {
    "mbbill/undotree",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" } },
  },
  {
    "folke/todo-comments.nvim",
    opts = {
      signs = false,
      highlight = { multiline = false },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "User FileOpened",
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
    keys = { { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" } },
  },
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    event = "User FileOpened",
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require "user.devicons"
    end,
    event = "User FileOpened",
  },
}
