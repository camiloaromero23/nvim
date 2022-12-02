local ok, lualine = pcall(require, "lualine")

if not ok then
  return
end

local lualine_utils = require "user.lsp.lualine_utils"

local window_width_limit = 70

local conditions = {
  buffer_not_empty = function()
    ---@diagnostic disable-next-line: missing-parameter
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > window_width_limit
  end,
}

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
    cond = conditions.hide_in_width,
  },
  filename = {
    "filename",
    color = {},
    cond = nil,
  },
  filetype = {
    "filetype",
    cond = conditions.hide_in_width,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
    cond = conditions.hide_in_width,
  },
  encoding = {
    "o:encoding",
    fmt = string.upper,
    color = {},
    cond = conditions.hide_in_width,
  },
  location = { "location", cond = conditions.hide_in_width, color = {} },
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
      ---@diagnostic disable-next-line: missing-parameter
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        -- TODO: clean up this if statement
        if type(msg) == "boolean" or #msg == 0 then
          return "LS Inactive"
        end
        return msg
      end
      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      -- add formatter
      local supported_formatters = lualine_utils.list_registered_formatters(buf_ft)
      vim.list_extend(buf_client_names, supported_formatters)

      -- add linter
      local supported_linters = lualine_utils.list_registered_linters(buf_ft)
      vim.list_extend(buf_client_names, supported_linters)

      ---@diagnostic disable-next-line: missing-parameter
      local unique_client_names = vim.fn.uniq(buf_client_names)
      return "[" .. table.concat(unique_client_names, ", ") .. "]"
    end,
    color = { gui = "bold" },
    cond = conditions.hide_in_width,
  },
}

local opts = {
  active = true,
  style = "nvim",
  options = {
    glabalstatus = true,
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    theme = "auto",
    disabled_filetypes = { "alpha", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { components.mode },
    lualine_b = {},
    lualine_c = { components.branch, components.filename, components.diagnostics },
    lualine_x = {
      components.filetype,
      components.lsp,
      components.encoding,
      components.location,
    },
    lualine_y = {},
    lualine_z = { components.scrollbar },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = nil,
  extensions = { "nvim-tree" },
}

lualine.setup(opts)
