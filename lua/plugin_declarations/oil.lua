return {
  "stevearc/oil.nvim",
  opts = {
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
  },
  keys = {
    { "<leader>-", "<cmd>lua require('oil').open()<cr>", desc = "Open oil" },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
