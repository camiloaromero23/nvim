local icons = require "config.user.icons"
return {
  {
    "LazyVim/LazyVim",
    ---@class LazyVimConfig
    opts = {
      colorscheme = "catppuccin",
      icons = {
        misc = {
          BoldLineLeft = "▎",
          ChevronRight = "",
          FindFile = "󰈞",
          FindText = "󰊄",
          LineLeft = "▏",
          TriangleShortArrowRight = "",
          dots = "󰇘",
        },
        ft = {
          octo = "",
        },
        dap = {
          Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
          Breakpoint = " ",
          BreakpointCondition = " ",
          BreakpointRejected = { " ", "DiagnosticError" },
          LogPoint = ".>",
        },
        diagnostics = {
          Error = icons.diagnostics.Error,
          Warn = icons.diagnostics.Warning,
          Info = icons.diagnostics.BigInformation,
          Hint = icons.diagnostics.Hint,
        },
        git = {
          added = " ",
          modified = " ",
          removed = " ",
        },
        kinds = {
          Array = " ",
          Boolean = "󰨙 ",
          Class = " ",
          Codeium = "󰘦 ",
          Color = " ",
          Control = " ",
          Collapsed = " ",
          Constant = "󰏿 ",
          Constructor = " ",
          Copilot = " ",
          Enum = " ",
          EnumMember = " ",
          Event = " ",
          Field = " ",
          File = " ",
          Folder = " ",
          Function = "󰊕 ",
          Interface = " ",
          Key = " ",
          Keyword = " ",
          Method = "󰊕 ",
          Module = " ",
          Namespace = "󰦮 ",
          Null = " ",
          Number = "󰎠 ",
          Object = " ",
          Operator = " ",
          Package = " ",
          Property = " ",
          Reference = " ",
          Snippet = "󱄽 ",
          String = " ",
          Struct = "󰆼 ",
          Supermaven = " ",
          TabNine = "󰏚 ",
          Text = " ",
          TypeParameter = " ",
          Unit = " ",
          Value = " ",
          Variable = "󰀫 ",
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        bufferline = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          BlinkCmpDoc = { fg = colors.text },
          BlinkCmpDocBorder = { fg = colors.text },
          BlinkCmpDocSeparator = { fg = colors.text },
          BlinkCmpMenu = { fg = colors.text },
          BlinkCmpMenuBorder = { fg = colors.text },
          BlinkCmpSignatureHelp = { fg = colors.text },
          BlinkCmpSignatureHelpBorder = { fg = colors.text },

          CursorLineNr = { fg = colors.blue },

          DiagnosticFloatingTextError = { fg = colors.red, bg = "", italic = true },
          DiagnosticFloatingTextHint = { fg = colors.mauve, bg = "", italic = true },
          DiagnosticFloatingTextInfo = { fg = colors.sky, bg = "", italic = true },
          DiagnosticFloatingTextOk = { fg = colors.green, bg = "", italic = true },
          DiagnosticFloatingTextWarn = { fg = colors.yellow, bg = "", italic = true },

          DiagnosticVirtualTextError = { fg = colors.red, bg = "", italic = true },
          DiagnosticVirtualTextHint = { fg = colors.mauve, bg = "", italic = true },
          DiagnosticVirtualTextInfo = { fg = colors.sky, bg = "", italic = true },
          DiagnosticVirtualTextOk = { fg = colors.green, bg = "", italic = true },
          DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = "", italic = true },

          DiagnosticFloatingHint = { fg = colors.mauve },
          DiagnosticHint = { fg = colors.mauve, italic = true },
          DiagnosticSignHint = { fg = colors.mauve },
          LspDiagnosticsDefaultHint = { fg = colors.mauve },
          LspDiagnosticsHint = { fg = colors.mauve },
          LspDiagnosticsVirtualTextHint = { fg = colors.mauve, italic = true },

          FloatBorder = { fg = colors.blue, bg = colors.mantle },

          GitSignsUntracked = { fg = "gray" },

          NavicText = { fg = colors.text },

          PackageInfoOutdatedVersion = { fg = colors.peach, italic = true },
          PackageInfoUpToDateVersion = { fg = colors.green, italic = true },

          SkActive = { bg = colors.mauve, fg = colors.surface0, italic = false },
          SkBg = { bg = colors.mantle },
          SkInactive = { bg = colors.surface0, fg = colors.mauve, italic = false },

          SnacksDashboardDesc = { fg = colors.text },
          SnacksDashboardIcon = { fg = colors.text },
          SnacksDashboardKey = { link = "Keyword" },
          SnacksDashboardTerminal = { link = "Number" },

          SnacksIndent = { fg = "#313244" },
          SnacksNormal = { bg = colors.base },

          SnacksPickerInput = { bg = colors.surface0, fg = colors.text },
          SnacksPickerInputBorder = { bg = colors.surface0 },
          SnacksPickerInputTitle = { bg = colors.red, fg = colors.surface0 },
          SnacksPickerListCursorLine = { bg = colors.surface0 },
          SnacksPickerPreviewTitle = { bg = colors.green, fg = colors.surface0 },
          SnacksPickerTitle = { bg = colors.lavender, fg = colors.surface0 },
        }
      end,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.api.nvim_set_hl(0, "ColorTransparent", { fg = "#404040" })
    end,
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require "rainbow-delimiters"

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
          tsx = "rainbow-parens",
        },
        highlight = {
          "RainbowDelimiterYellow",
          "RainbowDelimiterViolet",
          "RainbowDelimiterBlue",
        },
      }
    end,
    event = "VeryLazy",
  },
}
