local ok, lualine = pcall(require, "lualine")
local icons = require("user.icons").diagnostics

if not ok then
  return
end

local palettes_ok, catppuccin_palettes = pcall(require, "catppuccin.palettes")

local mocha_ok = false
local mocha

if palettes_ok then
  mocha_ok, mocha = pcall(catppuccin_palettes.get_palette, "mocha")
end

local lualine_utils = require "user.lsp.lualine_utils"

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
    cond = lualine_utils.hide_in_width,
  },
  filename = {
    "filename",
    color = {},
    cond = nil,
  },
  filetype = {
    "filetype",
    cond = lualine_utils.hide_in_width,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = icons.Hint .. " " },
    cond = lualine_utils.hide_in_width,
  },
  encoding = {
    "o:encoding",
    fmt = string.upper,
    color = {},
    cond = lualine_utils.hide_in_width,
  },
  location = { "location", cond = lualine_utils.hide_in_width, color = {} },
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
      local buf_clients = vim.lsp.get_clients()
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
          local client_name = client.name == "GitHub Copilot" and "copilot" or client.name
          table.insert(buf_client_names, client_name)
        end
      end

      -- add formatter
      local supported_formatters = lualine_utils.list_registered_formatters(buf_ft)
      vim.list_extend(buf_client_names, supported_formatters)

      -- add linter
      local supported_linters = lualine_utils.list_registered_linters(buf_ft)
      vim.list_extend(buf_client_names, supported_linters)

      local unique_client_names = vim.fn.uniq(buf_client_names)
      ---@diagnostic disable-next-line: param-type-mismatch
      return "[" .. table.concat(unique_client_names, ", ") .. "]"
    end,
    color = { gui = "bold" },
    cond = lualine_utils.hide_in_width,
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
