local icons = require "user.icons"
return {
  -- Core plugins
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

  -- My plugins
  { "tpope/vim-surround", event = "User FileOpened" },

  -- Git
  {
    "tpope/vim-fugitive",
    -- event = "User FileOpened",
    keys = {
      { "<leader>gf", "<cmd>Git<cr>", desc = "Git Fugitive" },
      -- TODO: find keymaps for diffget
      --   vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
      --   vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
    },
    cmd = {
      "Git",
    },
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require "user.alpha"
    end,
    keys = {
      "<leader>;",
      "<cmd>Alpha<CR>",
      desc = "Dashboard",
    },
    lazy = false,
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
    main = "ibl",
    opts = {
      indent = { char = icons.ui.LineLeft },
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
    build = "cd app && npx --yes yarn install",
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
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },
}
