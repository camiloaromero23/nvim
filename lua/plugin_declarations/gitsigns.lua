local icons = require "user.icons"
return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = {
        text = icons.ui.BoldLineLeft,
      },
      change = {
        text = icons.ui.BoldLineLeft,
      },
      delete = {
        text = icons.ui.TriangleShortArrowRight,
      },
      topdelete = {
        text = icons.ui.TriangleShortArrowRight,
      },
      changedelete = {
        text = icons.ui.BoldLineLeft,
      },
      untracked = {
        text = icons.ui.BoldLineLeft,
      },
    },
    signcolumn = true,
    word_diff = false,
    attach_to_untracked = true,
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      delay = 0,
      virt_text_priority = 10000,
    },
    current_line_blame_formatter = "    <author>, <author_time:%R> • <summary>",
    current_line_blame_formatter_nc = "    Not Commited Yet",
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    sign_priority = 6,
    update_debounce = 200,
    status_formatter = nil, -- Use default
  },
  keys = {
    {
      "<leader>gj",
      "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
      desc = "Next Hunk",
    },
    {
      "<leader>gk",
      "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
      desc = "Prev Hunk",
    },
    {
      "<leader>gl",
      "<cmd>lua require 'gitsigns'.blame_line()<cr>",
      desc = "Blame",
    },
    {
      "<leader>gp",
      "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
      desc = "Preview Hunk",
    },
    {
      "<leader>gr",
      "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
      desc = "Reset Hunk",
    },
    {
      "<leader>gR",
      "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
      desc = "Reset Buffer",
    },
    {
      "<leader>gs",
      "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
      desc = "Stage Hunk",
    },
    {
      "<leader>gu",
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      desc = "Undo Stage Hunk",
    },
    {
      "<leader>gd",
      "<cmd>Gitsigns diffthis HEAD<cr>",
      desc = "Git Diff",
    },
  },

  event = "User FileOpened",
}
