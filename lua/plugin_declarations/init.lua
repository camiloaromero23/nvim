return {
  -- Core plugins
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

  -- My plugins

  -- Git
  {
    "tpope/vim-fugitive",
    -- event = "VeryLazy",
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
    "nvim-lualine/lualine.nvim",
    config = function()
      require "user.lualine"
    end,
    event = "VeryLazy",
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
    event = "VeryLazy",
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
    event = "VeryLazy",
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
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require "user.devicons"
    end,
    event = "VeryLazy",
  },

  {
    "alexghergh/nvim-tmux-navigation",
    opts = true,
    cmd = {
      "NvimTmuxNavigateLeft",
      "NvimTmuxNavigateDown",
      "NvimTmuxNavigateUp",
      "NvimTmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd>NvimTmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd>NvimTmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd>NvimTmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd>NvimTmuxNavigateRight<cr>" },
    },
  },
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      winopts = {
        border = "solid",
      },
      winhl = "FloatBorder:SkBg,Normal:SkBg",
      show_count = true,
      position = custom_nvim.showkeys_position,
    },
  },
  {
    {
      "NStefan002/screenkey.nvim",
      lazy = false,
      opts = {
        win_opts = {
          row = vim.o.lines - vim.o.cmdheight - 2,
          col = vim.o.columns,
          width = 30,
          height = 1,
          border = "none",
        },
        group_mappings = true,
      },
      version = "*", -- or branch = "dev", to use the latest commit
      cmd = "ScreenKey",
      enabled = false,
    },
  },
}
