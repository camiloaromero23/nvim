return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      close_command = "bd %d", -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bd %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions" middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
      -- NOTE: this plugin is designed with this icon in mind,
      -- and so changing this is NOT recommended, this is intended
      -- as an escape hatch for people who cannot bear it for whatever reason
      -- indicator = {
      --   ---@diagnostic disable-next-line: assign-type-mismatch
      --   style = "▎",
      -- },
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      -- close_icon = '',
      left_trunc_marker = "",
      right_trunc_marker = "",
      --- name_formatter can be used to change the buffer's label in the bufferline.
      --- Please note some names can/will break the
      --- bufferline so use this at your discretion knowing that it has
      --- some limitations that will *NOT* be fixed.
      name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
        -- remove extension from markdown files for example
        ---@diagnostic disable-next-line: undefined-field
        if buf.name:match "%.md" then
          ---@diagnostic disable-next-line: undefined-field
          return vim.fn.fnamemodify(buf.name, ":t:r")
        end
        ---@diagnostic disable-next-line: undefined-field
        return buf.name
      end,
      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      tab_size = 21,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      -- diagnostics_indicator = nil,
      diagnostics_indicator = function(_, _, diagnostics, _)
        local icons = require "user.icons"
        local result = {}
        local symbols = {
          error = icons.diagnostics.Error,
          warning = icons.diagnostics.Warning,
          info = icons.diagnostics.Information,
        }
        for name, count in pairs(diagnostics) do
          if symbols[name] and count > 0 then
            table.insert(result, symbols[name] .. " " .. count)
          end
        end
        local res = table.concat(result, " ")
        return #res > 0 and res or ""
      end,
      -- NOTE: this will be called a lot so don't do any heavy processing here
      -- custom_filter = function(buf_number)
      --   -- filter out filetypes you don't want to see
      --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
      --     return true
      --   end
      --   -- filter out by buffer name
      --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
      --     return true
      --   end
      --   -- filter out based on arbitrary rules
      --   -- e.g. filter out vim wiki buffer from tabline in your work repo
      --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
      --     return true
      --   end
      -- end,
      offsets = {
        {
          filetype = "undotree",
          text = "Undotree",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "DiffviewFiles",
          text = "Diff View",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "flutterToolsOutline",
          text = "Flutter Outline",
          highlight = "PanelHeading",
        },
        {
          filetype = "lazy",
          text = "Lazy",
          highlight = "PanelHeading",
          padding = 1,
        },
      },
      get_element_icon = function(element)
        -- element consists of {filetype: string, path: string, extension: string, directory: string}
        -- This can be used to change how bufferline fetches the icon
        -- for an element e.g. a buffer or a tab.
        -- e.g.
        local icon, hl = require("nvim-web-devicons").get_icon(
          vim.fn.fnamemodify(element.path, ":t"),
          element.extension
        )
        return icon, hl
      end,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      sort_by = "id",
      -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
      --   -- add custom logic
      --   return buffer_a.modified > buffer_b.modified
      -- end
    },
    highlights = {
      fill = {
        bg = "#1A1A1A",
      },
      background = {
        italic = true,
      },
      buffer_selected = {
        bold = true,
      },
    },
  },
  event = "User FileOpened",
}
