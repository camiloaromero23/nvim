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
  event = "User FileOpened",
}
