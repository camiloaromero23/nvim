local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local formatting_method = null_ls.methods.FORMATTING
local alternative_methods = {
  null_ls.methods.DIAGNOSTICS,
  null_ls.methods.DIAGNOSTICS_ON_OPEN,
  null_ls.methods.DIAGNOSTICS_ON_SAVE,
}

local M = {}

local list_registered_providers_names = function(filetype)
  local s = require "null-ls.sources"
  local available_sources = s.get_available(filetype)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

M.list_registered_formatters = function(filetype)
  local registered_providers = list_registered_providers_names(filetype)
  return registered_providers[formatting_method] or {}
end

M.list_registered_linters = function(filetype)
  local registered_providers = list_registered_providers_names(filetype)
  local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
    return registered_providers[m] or {}
  end, alternative_methods))

  return providers_for_methods
end

M.hide_in_width = function()
  local window_width_limit = 70
  return vim.fn.winwidth(0) > window_width_limit
end

return M
