local dashboard_config = require("user.snacks.dashboard")
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    ---@module 'snacks.nvim'
    opts = {
      bigfile = { enabled = true },
      dashboard = dashboard_config,
      indent = { enabled = false },
      input = { enabled = false },
      notifier = {
        enabled = true,
        timeout = 3000,
        style = "fancy",
      },
      quickfile = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
      ---@class snacks.styles.Config
      styles = {
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
      },
    },
  },
}
