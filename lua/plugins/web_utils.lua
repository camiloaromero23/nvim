return {
  {
    "vuki656/package-info.nvim",
    opts = {
      icons = {
        enable = true, -- Whether to display icons
        style = {
          up_to_date = "|  ", -- Icon for up to date dependencies
          outdated = "|  ", -- Icon for outdated dependencies
        },
      },
      autostart = true, -- Whether to autostart when `package.json` is opened
      hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
      hide_unstable_versions = true, -- It hides unstable versions from version list e.g next-11.1.3-canary3
      -- Can be `npm`, `yarn`, or `pnpm`. Used for `delete`, `install` etc...
      -- The plugin will try to auto-detect the package manager based on
      -- `yarn.lock` or `package-lock.json`. If none are found it will use the
      -- provided one, if nothing is provided it will use `yarn`
      package_manager = "pnpm",
    },

    config = function(_, opts)
      local package_info = require "package-info"
      package_info.setup(opts)

      vim.keymap.set("n", "<leader>Dt", package_info.toggle, { desc = "Toggle dependency versions", buffer = 0 })
      vim.keymap.set("n", "<leader>Du", package_info.update, { desc = "Update dependency on the line", buffer = 0 })
      vim.keymap.set("n", "<leader>Dd", package_info.delete, { desc = "Delete dependency on the line", buffer = 0 })
      vim.keymap.set("n", "<leader>Di", package_info.install, { desc = "Install a new dependency", buffer = 0 })
      vim.keymap.set(
        "n",
        "<leader>Dp",
        package_info.change_version,
        { desc = "Install a different dependency version", buffer = 0 }
      )
    end,
    event = "BufRead package.json",
    dependencies = { "MunifTanjim/nui.nvim" },
  },
  {
    "dmmulroy/tsc.nvim",
    opts = {},
    event = "VeryLazy",
    keys = {
      {
        "<leader>lt",
        function()
          vim.cmd "TSC"
        end,
        desc = "Type Check (only for TS files)",
      },
    },
  },
}
