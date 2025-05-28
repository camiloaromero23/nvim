return {
  "akinsho/bufferline.nvim",
  event = { "BufRead", "BufNewFile" },
  opts = {
    options = {
      always_show_bufferline = true,
      highlights = {
        background = {
          italic = true,
        },
        buffer_selected = {
          bold = false,
          italic = true,
        },
      },
      tab_size = 21,
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",

      diagnostics_indicator = function(_, _, diagnostics, _)
        local icons = require("config.user.icons")
        local ret = (diagnostics.error and icons.diagnostics.Error .. " " .. diagnostics.error .. " " or "")
          .. (diagnostics.warning and icons.diagnostics.Warning .. " " .. diagnostics.warning or "")
          .. (diagnostics.info and icons.diagnostics.Information .. " " .. diagnostics.info or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "undotree",
          text = "Undotree",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "neo-tree",
          text = "Explorer",
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

        {
          filetype = "snacks_layout_box",
        },
      },
    },
  },
}
