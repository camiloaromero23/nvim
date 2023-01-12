return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.0",
    config = function()
      require "user.telescope"
    end,
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable "make" == 1,
  },
}
