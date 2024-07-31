return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  cond = custom_nvim.enable_obsidian,
  lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre "
      .. vim.fn.expand "~"
      .. "/Documents/Obsidian/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Documents/Obsidian/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "Work",
        path = "~/Documents/Obsidian/Work",
      },
    },
  },
  -- init = function()
  --   -- vim.o.conceallevel = 2
  --   vim.api.nvim_set_option_value("conceallevel", 2, {
  --     scope = "local",
  --   })
  -- end,
  config = function(_, opts)
    require("obsidian").setup(opts)
    vim.api.nvim_set_option_value("conceallevel", 2, {
      scope = "local",
    })
  end,
}
