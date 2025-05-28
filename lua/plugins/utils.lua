return {
  {
    "Wansmer/treesj",
    opts = {
      use_default_keymaps = false,
    },
    keys = { { "<space>j", "<cmd>lua require('treesj').toggle()<cr>", desc = "Toggle Split Join" } },
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
    "mbbill/undotree",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" } },
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
      position = "bottom-right",
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
