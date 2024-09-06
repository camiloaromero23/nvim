return {
  {
    "stevearc/oil.nvim",
    opts = {
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["q"] = "actions.close",
        ["<C-l>"] = false,
        ["<C-h>"] = false,
        ["<C-r>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
      -- win_options = {
      -- signcolumn = "yes:2",
      -- },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name)
          -- is .git folder
          if name == ".git" then
            return true
          end
          return false
        end,
      },
      -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
      skip_confirm_for_simple_edits = true,
    },
    keys = {
      { "<leader>-", "<cmd>lua require('oil').open()<cr>", desc = "Open oil" },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- {
  --   "refractalize/oil-git-status.nvim",
  --   dependencies = {
  --     "stevearc/oil.nvim",
  --   },
  --   config = true,
  -- },
}
