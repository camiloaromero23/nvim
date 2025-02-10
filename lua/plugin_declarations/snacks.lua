local icons = require("user.icons").ui
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    ---@module 'snacks.nvim'
    opts = {
      bigfile = { enabled = true },
      ---@class snacks.dashboard.Config
      dashboard = {
        row = 3,
        enabled = true,
        preset = {
          header = [[
                 #######                
          ###    #######    ###         
       (######## ####### ########%      
        #########################       
          #####################         
    #################################   
    #################################   
    #################################   
          #####################         
        #########################       
       ######### ####### ########.      
          ###    #######    ###         
                 #######                
      ]],
          keys = {
            {
              icon = icons.FindFile,
              desc = "Find File",
              key = "<leader>sf",
              action = ":lua Snacks.dashboard.pick('files')",
            },
            {
              icon = "",
              desc = "Recently Used Files",
              key = "<leader>sr",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            {
              icon = icons.FindText,
              desc = "Find Word",
              key = "<leader>st",
              action = ":lua Snacks.dashboard.pick('live_grep')",
            },
            {
              icon = "",
              desc = "Configuration",
              key = "<leader>C",
              action = "<cmd>edit ~/.config/nvim/init.lua <cr>",
            },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1, width = 10 },
          {
            section = "terminal",
            cmd = "nvim --version | head -n 1 | sed 's/-dev//'",
            width= 12,
            height = 5,
            indent = 24,
            -- hl = " s",
          },
        },
      },
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
