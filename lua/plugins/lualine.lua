return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require "lualine_require"
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus

    local conform_ok, conform = pcall(require, "conform")

    if not conform_ok then
      return
    end

    local palettes_ok, catppuccin_palettes = pcall(require, "catppuccin.palettes")

    local mocha_ok = false
    local mocha

    if palettes_ok then
      mocha_ok, mocha = pcall(catppuccin_palettes.get_palette, "mocha")
    end

    local icons = require "config.user.icons"

    local components = {
      mode = {
        function()
          return " "
        end,
        padding = { left = 0, right = 0 },
        color = {},
        cond = nil,
      },
      branch = {
        "b:gitsigns_head",
        icon = " ",
        color = { gui = "bold" },
      },
      diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = icons.diagnostics.Hint .. " " },
      },
      encoding = {
        "o:encoding",
        fmt = string.upper,
        color = {},
      },
      location = { "location", color = {} },
      progress = {
        "progress",
        fmt = function()
          return "%P/%L"
        end,
        color = {
          bg = mocha_ok and mocha.blue or "#ADD8E6",
          fg = mocha_ok and mocha.surface0 or "#505050",
          gui = "bold",
        },
      },
      scrollbar = {
        function()
          local current_line = vim.fn.line "."
          local total_lines = vim.fn.line "$"
          local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
          local line_ratio = current_line / total_lines
          local index = math.ceil(line_ratio * #chars)
          return chars[index]
        end,
        padding = { left = 0, right = 0 },
        color = { bg = "#202328", fg = "#ADD8E6" },
        cond = nil,
      },
      lsp = {
        function(msg)
          msg = msg or "LS Inactive"
          local buf_clients = vim.lsp.get_clients { bufnr = 0 }
          if next(buf_clients) == nil then
            -- TODO: clean up this if statement
            if type(msg) == "boolean" or #msg == 0 then
              return "LS Inactive"
            end
            return msg
          end
          local buf_client_names = {}

          -- add client
          for _, client in pairs(buf_clients) do
            local client_name = client.name == "GitHub Copilot" and "copilot" or client.name
            table.insert(buf_client_names, client_name)
          end

          -- add formatters
          local conform_formatters = conform.list_formatters(0)
          for _, formatter in pairs(conform_formatters) do
            table.insert(buf_client_names, formatter.name)
          end

          local unique_client_names = vim.fn.uniq(buf_client_names)
          ---@diagnostic disable-next-line: param-type-mismatch
          return "[" .. table.concat(unique_client_names, ", ") .. "]"
        end,
        color = { gui = "bold" },
      },
    }

    local opts = {
      style = "nvim",
      options = {
        globalstatus = vim.o.laststatus == 3,
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        theme = "auto",
        disabled_filetypes = { "alpha", "neo-tree", "NvimTree", "Outline", "snacks_dashboard" },
        -- disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        always_divide_middle = true,
      },

      sections = {
        lualine_a = { components.mode },
        lualine_b = {},
        lualine_c = {
          { "branch", icon = " ", color = { gui = "bold" } },
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = icons.diagnostics.Hint .. " " },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path(), separator = icons.ui.ChevronRight },
        },
        lualine_x = {
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = function()
              return { fg = Snacks.util.color "Statement" }
            end,
          },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = function()
              return { fg = Snacks.util.color "Debug" }
            end,
          },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_y = {},
        lualine_z = {
          {
            "progress",
            fmt = function()
              return "%P/%L"
            end,
            color = {
              bg = mocha_ok and mocha.blue or "#ADD8E6",
              fg = mocha_ok and mocha.surface0 or "#505050",
              gui = "bold",
            },
          },
        },
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    if vim.g.trouble_lualine and LazyVim.has "trouble.nvim" then
      local trouble = require "trouble"
      local symbols = trouble.statusline {
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      }
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end

    return opts
  end,
}
