return {
  {
    "echasnovski/mini.ai",
    opts = true,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.files",
    dependencies = {
      "snacks.nvim",
    },
    opts = {
      mappings = {
        go_in = "L",
        go_in_plus = "<CR>",
        go_out = "H",
        go_out_plus = "-",
        synchronize = "<leader>w",
        reset = "=",
      },
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 80,
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesActionRename",
        callback = function(event)
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end,
      })
    end,
    keys = {
      {
        "<leader>-",
        function()
          MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        end,
        desc = "Open Mini Files",
      },
    },
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.pairs",
    opts = true,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.surround",
    opts = {
      search_method = "cover_or_next",
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    },
    event = "VeryLazy",
  },
}
