return {
  {
    "echasnovski/mini.ai",
    opts = true,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.files",
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
    },
    event = "VeryLazy",
  },
}
