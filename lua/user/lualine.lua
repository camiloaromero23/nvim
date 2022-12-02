local ok, lualine = pcall(require, "lualine")

if not ok then
  return
end

local window_width_limit = 70

local conditions = {
  buffer_not_empty = function()
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
    cond = conditions.hide_in_width
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
}

local opts = {
  active = true,
  style = "nvim",
  options = {
    glabalstatus = true,
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    theme = 'auto',
    disabled_filetypes = { "alpha", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { components.mode },
    lualine_b = {},
    lualine_c = { components.branch, components.filename, components.diagnostics },
    lualine_x = {
      components.filetype,
      -- components.lsp,
      components.encoding,
      components.location,
    },
    lualine_y = {},
    lualine_z = { components.scrollbar },
  },
  inactive_sections = {
    lualine_a = {
      "filename",
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = nil,
  extensions = { "nvim-tree" },
  on_config_done = nil,
}

lualine.setup(opts)
