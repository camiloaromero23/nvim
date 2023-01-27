local winbar_augroup = require("user.augroups").winbar
local icons = require "user.icons"

local filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neo-tree",
  "neogitstatus",
  "NvimTree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
  "DressingSelect",
  "Jaq",
  "harpoon",
  "dap-repl",
  "dap-terminal",
  "dapui_console",
  "lab",
  "Markdown",
  "",
}

local excludes = function()
  return vim.tbl_contains(filetype_exclude, vim.bo.filetype)
end

local get_filename = function()
  ---@diagnostic disable-next-line: missing-parameter
  local filename = vim.fn.expand "%:t"
  ---@diagnostic disable-next-line: missing-parameter
  local extension = vim.fn.expand "%:e"
  local f = require "user.utils.functions"

  if not f.isempty(filename) then
    local file_icon, file_icon_color = require("nvim-web-devicons").get_icon_color(
      filename,
      extension,
      { default = true }
    )

    local hl_group = "FileIconColor" .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if f.isempty(file_icon) then
      file_icon = icons.kind.File
    end

    -- local buf_ft = vim.bo.filetype

    -- if buf_ft == "dapui_breakpoints" then
    --   file_icon = icons.ui.Bug
    -- end

    -- if buf_ft == "dapui_stacks" then
    --   file_icon = icons.ui.Stacks
    -- end

    -- if buf_ft == "dapui_scopes" then
    --   file_icon = icons.ui.Scopes
    -- end

    -- if buf_ft == "dapui_watches" then
    --   file_icon = icons.ui.Watches
    -- end

    -- if buf_ft == "dapui_console" then
    --   file_icon = icons.ui.DebugConsole
    -- end

    -- local navic_text = vim.api.nvim_get_hl_by_name("Normal", true)
    vim.api.nvim_set_hl(0, "Winbar", {})

    return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#Winbar#" .. filename .. "%*"
  end
end

local get_gps = function()
  local status_gps_ok, gps = pcall(require, "nvim-navic")
  if not status_gps_ok then
    return ""
  end

  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return ""
  end

  if not gps.is_available() or gps_location == "error" then
    return ""
  end

  if require("user.utils.functions").isempty(gps_location) then
    return ""
  end
  gps_location = string.sub(gps_location, 1)

  return icons.ui.ChevronRight .. " " .. gps_location
end

local get_winbar = function()
  if excludes() then
    return
  end
  local f = require "user.utils.functions"
  local value = get_filename()

  if not f.isempty(value) then
    local gps_value = get_gps()
    -- print "**************************"
    -- print(gps_value)
    -- print "**************************"
    value = value .. " " .. gps_value
  end

  -- local num_tabs = #vim.api.nvim_list_tabpages()

  -- if num_tabs > 1 and not f.isempty(value) then
  --   local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
  --   value = value .. "%=" .. tabpage_number .. "/" .. tostring(num_tabs)
  -- end

  local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
  if not status_ok then
    return
  end
end

local ok, navic = pcall(require, "nvim-navic")

if not ok then
  return
end

vim.api.nvim_create_autocmd(
  { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
  {
    group = winbar_augroup,
    callback = function()
      local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
      if not status_ok then
        -- TODO:
        get_winbar()
      end
    end,
  }
)

navic.setup {
  icons = {
    Array = icons.kind.Array .. " ",
    Boolean = icons.kind.Boolean,
    Class = icons.kind.Class .. " ",
    Color = icons.kind.Color .. " ",
    Constant = icons.kind.Constant .. " ",
    Constructor = icons.kind.Constructor .. " ",
    Enum = icons.kind.Enum .. " ",
    EnumMember = icons.kind.EnumMember .. " ",
    Event = icons.kind.Event .. " ",
    Field = icons.kind.Field .. " ",
    File = icons.kind.File .. " ",
    Folder = icons.kind.Folder .. " ",
    Function = icons.kind.Function .. " ",
    Interface = icons.kind.Interface .. " ",
    Key = icons.kind.Key .. " ",
    Keyword = icons.kind.Keyword .. " ",
    Method = icons.kind.Method .. " ",
    Module = icons.kind.Module .. " ",
    Namespace = icons.kind.Namespace .. " ",
    Null = icons.kind.Null .. " ",
    Number = icons.kind.Number .. " ",
    Object = icons.kind.Object .. " ",
    Operator = icons.kind.Operator .. " ",
    Package = icons.kind.Package .. " ",
    Property = icons.kind.Property .. " ",
    Reference = icons.kind.Reference .. " ",
    Snippet = icons.kind.Snippet .. " ",
    String = icons.kind.String .. " ",
    Struct = icons.kind.Struct .. " ",
    Text = icons.kind.Text .. " ",
    TypeParameter = icons.kind.TypeParameter .. " ",
    Unit = icons.kind.Unit .. " ",
    Value = icons.kind.Value .. " ",
    Variable = icons.kind.Variable .. " ",
  },
  highlight = true,
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}
