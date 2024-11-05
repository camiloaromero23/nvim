local ok, lualine = pcall(require, "lualine")
local icons = require("user.icons").diagnostics

if not ok then
  return
end

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

local hide_in_width = function()
  local window_width_limit = 70
  return vim.fn.winwidth(0) > window_width_limit
end

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
    cond = hide_in_width,
  },
  filename = {
    "filename",
    color = {},
    cond = nil,
  },
  filetype = {
    "filetype",
    cond = hide_in_width,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = icons.Hint .. " " },
    cond = hide_in_width,
  },
  encoding = {
    "o:encoding",
    fmt = string.upper,
    color = {},
    cond = hide_in_width,
  },
  location = { "location", cond = hide_in_width, color = {} },
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
    cond = hide_in_width,
  },
}

lualine.setup {
  active = true,
  style = "nvim",
  options = {
    globalstatus = true,
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    theme = "auto",
    disabled_filetypes = { "alpha", "neo-tree", "NvimTree", "Outline" },
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
    lualine_z = { components.progress },
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
vim.o.laststatus = 3
vim.o.cmdheight = 1 -- more space in the neovim command line for displaying messages
