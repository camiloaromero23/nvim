local icons = LazyVim.config.icons.misc
local custom_icons = require("config.user.icons").ui

return {
  "snacks.nvim",
  dependencies = { "LazyVim/LazyVim" },
  opts = {
    picker = {
      prompt = "  ",
      matcher = {
        frecency = true,
      },
      previewers = {
        git = {
          native = true,
          args = {
            "-c",
            "delta.side-by-side=false",
            "-c",
            "delta.line-numbers=false",
            "-c",
            "delta.navigate=false",
            "-c",
            "delta.file-style=omit",
            "-c",
            "delta.hunk-header-style=omit",
          },
        },
      },
      layout = {
        preset = "telescope_custom",
      },
      formatters = {
        selected = {
          show_always = true,
          unselected = false,
        },
      },
      layouts = {
        telescope_custom = {
          reverse = true,
          layout = {
            box = "horizontal",
            backdrop = false,
            width = 0.85,
            height = 0.8,
            border = "none",
            {
              box = "vertical",
              { win = "list", title = " Results ", title_pos = "center", border = "solid" },
              { win = "input", height = 1, border = "solid", title = "{title}", title_pos = "center" },
            },
            {
              win = "preview",
              title = "{preview:Preview}",
              width = 0.6125,
              border = "solid",
              title_pos = "center",
            },
          },
        },
      },
      win = {
        input = {
          keys = {
            ["<C-n>"] = { "history_forward", mode = { "i" } },
            ["<C-p>"] = { "history_back", mode = { "i" } },
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<S-Tab>"] = { "select_and_next", mode = { "i", "n" } },
            ["<Tab>"] = { "select_and_prev", mode = { "i", "n" } },
          },
        },
        preview = {
          wo = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
          },
        },
      },
    },

    ---@class snacks.indent.Config
    indent = {
      enabled = true,
      indent = {
        char = icons.LineLeft,
      },
      animate = {
        enabled = false,
      },
      scope = {
        enabled = false,
      },
    },

    lazygit = {
      enabled = true,
      configure = false,
    },

    dashboard = {

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
            icon = custom_icons.FindFile,
            desc = "Find File",
            key = "<leader>sf",
            action = function()
              Snacks.picker.files {
                hidden = true,
              }
            end,
          },
          {
            icon = "",
            desc = "Recently Used Files",
            key = "<leader>sr",
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = custom_icons.FindText,
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
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
        },
      },
    },
    ---
    ---@class snacks.image.Config
    image = {
      enabled = true,
      doc = {
        enabled = true,
        inline = false,
        float = true,
      },
    },

    ---@class snacks.styles.Config
    styles = {
      snacks_image = {
        relative = "editor",
        col = -1,
      },

      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
      lazygit = {
        width = 0,
        height = 0,
      },
    },
  },
  keys = {
    {
      "<leader>sf",
      function()
        Snacks.picker.files {
          hidden = true,
        }
      end,
      desc = "Find File",
    },
    {
      "<leader>se",
      function()
        Snacks.picker.files {
          title = "Find .env files",
          cmd = "rg",
          ignored = true,
          search = "*.env*",
        }
      end,
      desc = "Find .env files",
    },
    {
      "<leader>sD",
      function()
        Snacks.picker.files {
          cwd = vim.fn.expand "%:p:h",
        }
      end,
      desc = "Find file in cwd",
    },
    {
      "<leader>sF",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Find Help",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Open Recent File",
    },
    {
      "<leader>sR",
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>st",
      function()
        Snacks.picker.grep()
      end,
      desc = "Text",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>bf",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Find",
    },
    {
      "<leader>sp",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorscheme with Preview",
    },
    {
      "<leader>go",
      function()
        Snacks.picker.git_status {
          win = {
            input = {
              keys = {
                ["<Tab>"] = { "git_stage", mode = { "n", "i" } },
                ["S<Tab>"] = { "git_stage", mode = { "n", "i" } },
              },
            },
          },
        }
      end,
      desc = "Open Changed File",
    },
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Checkout branch",
    },
    {
      "<leader>ld",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Buffer Diagnostics",
    },
    {
      "<leader>lw",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>ls",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "Document Symbols",
    },
    {
      "<leader>lS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "Workspace Symbols",
    },
    {
      "<leader>le",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix",
    },

    {
      "<leader>lg",
      function()
        Snacks.lazygit.open()
      end,
      desc = "Lazygit",
    },
  },
}
