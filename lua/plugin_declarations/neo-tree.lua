return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", ":Neotree toggle reveal left<CR>", silent = true, desc = "File Explorer" },
    -- { "<leader>e", ":Neotree toggle current reveal_force_cwd left<CR>", silent = true, desc = "File Explorer" },
    -- Neotree float reveal_file=<cfile> reveal_force_cwd
  },
  config = function()
    require("neo-tree").setup {
      close_if_last_window = true,
      popup_border_style = "single",
      enable_git_status = true,
      enable_modified_markers = true,
      enable_diagnostics = false,
      sort_case_insensitive = true,
      default_component_configs = {
        indent = {
          with_markers = false,
          with_expanders = true,
        },
        modified = {
          symbol = " ",
          highlight = "NeoTreeModified",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "",
            deleted = "",
            modified = "",
            renamed = "",
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
      window = {
        mappings = {
          ["l"] = { "open", config = { focus = true } },
          ["h"] = { "close_node" },
          ["v"] = { "open_vsplit" },
          ["f"] = { "fuzzy_finder" },
          ["/"] = "noop",
        },
        position = "float",
        width = 30,
      },
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            -- "node_modules",
          },
          never_show = {
            ".git",
            ".cache",
            ".DS_Store",
          },
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --              -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
      event_handlers = {
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd "wincmd ="
            end
          end,
        },
        {
          event = "file_opened",
          handler = function()
            vim.cmd "Neotree toggle left"
          end,
        },
        {
          event = "neo_tree_window_after_close",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd "wincmd ="
            end
          end,
        },
      },
    }
  end,
}
