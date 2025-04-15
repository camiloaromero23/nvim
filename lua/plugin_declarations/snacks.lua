local dashboard_config = require "user.snacks.dashboard"
local picker_config = require "user.snacks.picker"
local icons = require "user.icons"

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    ---@module 'snacks.nvim'
    opts = {
      bigfile = { enabled = true },
      dashboard = dashboard_config,
      lazygit = {
        enabled = true,
        configure = false,
      },
      picker = picker_config.opts,
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
        lazygit = {
          width = 0,
          height = 0,
        },
      },
      ---@class snacks.indent.Config
      indent = {
        enabled = true,
        indent = {
          char = icons.ui.LineLeft,
        },
        animate = {
          enabled = false,
        },
        scope = {
          enabled = false,
        },
      },
      scope = {
        enabled = true,
      },
      ---@class snacks.image.Config
      image = {
        enabled = true,
      }
    },
    keys = vim.list_extend({
      {
        "<leader>lg",
        function()
          Snacks.lazygit.open()
        end,
        desc = "Lazygit",
      },
    }, picker_config.keys),
  },
}
